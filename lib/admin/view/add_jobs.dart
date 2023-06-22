import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/admin/controller/add_jobs_service.dart';
import 'package:skillmaestro/admin/model/add_job_req_model.dart';
import 'package:skillmaestro/application/admin/add_job_provider.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';
import 'package:skillmaestro/common/widgets/textfield.dart';
import 'package:skillmaestro/core/constants.dart';

import '../../core/theme/access_token/token.dart';

class AddJobs extends StatefulWidget {
  const AddJobs({super.key});

  @override
  State<AddJobs> createState() => _AddJobsState();
}

File? profile;
String unknown = 'assets/user.png';

class _AddJobsState extends State<AddJobs> {
  File? cameraImage;
  File? galleryImage;

  bool isLoading = false;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final addjobProvider = context.read<AddJobProvider>();
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Form(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Add Job',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                widgets().sizedboxHeight40(),
                Center(
                  child: CircleAvatar(
                    radius: 63,
                    backgroundColor: const Color.fromARGB(255, 123, 230, 219),
                    child: GestureDetector(
                        onTap: () {
                          showModelBottomSheet(context, width);
                        },
                        child: profile != null
                            ? CircleAvatar(
                                radius: 60,
                                backgroundImage: FileImage(profile!),
                              )
                            : CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage(
                                  unknown,
                                ),
                              )),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                textfield(
                  textFieldName: 'Jobname',
                  controllerName: addjobProvider.job,
                  context: context,
                ),
                const SizedBox(
                  height: 50,
                ),
                textfield(
                  textFieldName: 'JobBasicRate',
                  controllerName: addjobProvider.bRate,
                  context: context,
                ),
                const SizedBox(
                  height: 50,
                ),
                textfield(
                  textFieldName: 'JobAdDitionalRate',
                  controllerName: addjobProvider.adRate,
                  context: context,
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      /* if (formkey.currentState!.validate()) {
                        addButtonClicked(context);
                      } */
                      addButtonClicked(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            mainColor // Set the background color of the button
                        ),
                    child: const Text('Add'))

                /*  loginSignupButton(
                  buttonName: 'Add',
                  functionName: AddButtonClicked(context),
                  pageroute: const BottomNavBar(),
                ) */
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future<dynamic> showModelBottomSheet(BuildContext context, double width) {
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
                  pickImageFromCamera();
                  Navigator.pop(context);
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
                onTap: () {
                  pickImageFromGallery();
                  Navigator.pop(context);
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

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(
        image.path,
      );
      setState(() {
        galleryImage = imageTemp;
        profile = galleryImage;
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
        profile = cameraImage;
      });
    } on PlatformException catch (e) {
      log(e.message.toString());
    }
  }

  addButtonClicked(BuildContext context) async {
    final provider = Provider.of<AddJobProvider>(context, listen: false);
    final job = provider.job.text;
    final bRate = int.parse(provider.bRate.text);
    final adRate = int.parse(provider.adRate.text);
    final image = File(profile!.path);

    File file = File(image.path);
    //String filename = file.path.split('/').last;
    //String filepath = filename;

    //String filepath = file.path;
    File imageFile = File(file.path);
    String? token = await getAdminAccesToken();

    JobModel jobmodel = JobModel(adRate: adRate, bRate: bRate, job: job);
    log("------------before sendmultipartrequest in addjob,dart");

    // ignore: use_build_context_synchronously
    AddJobService().sendMultipartRequest(context, imageFile, jobmodel);
  }
}
