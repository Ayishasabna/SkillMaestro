import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/expert_profile_provider.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';
import 'package:skillmaestro/common/widgets/textfield.dart';
import '../../core/constants.dart';
import '../model/expert_edit_profile_model.dart';

// ignore: must_be_immutable
class ExpertProfileEdit extends StatefulWidget {
  ExpertProfileEdit(
      {super.key,
      required this.userName,
      required this.mobile,
      required this.email,
      required this.image});
  String? userName;
  String? mobile;
  String? email;
  String? image;

  @override
  State<ExpertProfileEdit> createState() => _ExpertProfileEdittState();
}

class _ExpertProfileEdittState extends State<ExpertProfileEdit> {
  File? cameraImage;
  String? gigImage;
  File? gigImageFile;
  dynamic file;
  File? galleryImage;
  int flag = 0;

  @override
  void initState() {
    userNameController.text = widget.userName.toString();
    mobileController.text = widget.mobile.toString();
    emailController.text = widget.email.toString();
    super.initState();
  }

  final userNameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final skillsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
        ),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 6,
              width: double.infinity,
              child: Center(
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    bottomSheet(context, width);
                  },
                  child: gigImageFile != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(gigImageFile!),
                          radius: 60,
                        )
                      : widget.image != null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(
                                widget.image!,
                              ),
                              radius: 60,
                            )
                          : const CircleAvatar(
                              backgroundImage: AssetImage('assets/user.png'),
                              radius: 60,
                            ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                children: [
                  widgets().sizedboxHeight20(),
                  textfield(
                      textFieldName: "username",
                      controllerName: userNameController,
                      context: context),
                  widgets().sizedboxHeight20(),
                  textfield(
                      textFieldName: "email",
                      controllerName: emailController,
                      context: context),
                  widgets().sizedboxHeight20(),
                  /*  textfield(
                      textFieldName: "mobile",
                      controllerName: mobileController,
                      context: context),
                  widgets().sizedboxHeight40(), */
                  ElevatedButton(
                    onPressed: () {
                      updateButtonClicked();
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(width / 1.1, 45),
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Text(
                      'UPDATE',
                      //style: normalText.copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(
        image.path,
      );

      setState(() {
        galleryImage = imageTemp;
        gigImageFile = galleryImage;
        flag = 1;
      });
    } on PlatformException catch (e) {
      log(e.message.toString());
    }
  }

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(
        image.path,
      );

      setState(() {
        cameraImage = imageTemp;
        gigImageFile = cameraImage;
        flag = 1;
      });
    } on PlatformException catch (e) {
      log(e.message.toString());
    }
  }

  Future<dynamic> bottomSheet(BuildContext context, double width) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 95,
        width: width / 1.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  pickImageFromCamera();
                },
                child: Column(
                  children: const [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.blue,
                      size: 40,
                    ),
                    Text(
                      'Camera',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                  await pickImageFromGallery();
                },
                child: Column(
                  children: const [
                    Icon(
                      Icons.photo,
                      color: Colors.blue,
                      size: 40,
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateButtonClicked() async {
    EditExpertProfileModel editedData = EditExpertProfileModel(
      name: userNameController.text,
      email: emailController.text,
      //mobile: mobileController.text
    );
    //log("_____________update buton clicked_____");
    await Provider.of<ExpertProfileProvider>(context, listen: false)
        .editexpertProfile(editedData);
    // ignore: use_build_context_synchronously
    await Provider.of<ExpertProfileProvider>(context, listen: false)
        .getExpertDetails();
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}
