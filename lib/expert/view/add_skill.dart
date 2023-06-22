import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/admin/add_job_provider.dart';
import 'package:skillmaestro/application/expert/expert_provider.dart';

import '../../admin/view/add_jobs.dart';
import '../../common/widgets/widget.dart';
import '../../core/constants.dart';

class jobAddScreen extends StatefulWidget {
  jobAddScreen({super.key, required this.imagePath});
  File? imagePath;
  File? cameraImage;
  File? galleryImage;
  String unknown = 'assets/user.png';

  @override
  State<jobAddScreen> createState() => _jobAddScreenState();
}

class _jobAddScreenState extends State<jobAddScreen> {
  final titleController = TextEditingController();
  final serviceTypeController = TextEditingController();
  final overViewController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //final cloudinary = CloudinaryPublic('dzeuipdky', 'ml_default', cache: false);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          'Add Job',
          //style: headText,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(
              height: width / 2.5,
              width: width,
              child: Center(
                child: CircleAvatar(
                  radius: 63,
                  backgroundColor: Colors.teal[400],
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
              /* Image.file(
                widget.imagePath!,
                fit: BoxFit.cover,
              ), */
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  TextFieldName(value: 'JobTitle'),
                  MyTextFormField(
                    controller: titleController,
                  ),
                  TextFieldName(value: 'BaseRate'),
                  MyTextFormField(
                    controller: overViewController,
                  ),
                  TextFieldName(value: 'AdditionalRate'),
                  MyTextFormField(
                    controller: descriptionController,
                  ),
                  TextFieldName(value: 'Discription'),
                  MyTextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                  ),
                  TextFieldName(value: 'CreatedAt'),
                  MyTextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                  ),
                  Consumer<AddJobProvider>(
                    builder: (context, values, child) => Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                        ),
                        const Text('Is Listed'),
                        // Checkbox(
                        //   value: values.addproductCheckBoxValue,
                        //   onChanged: (value) {
                        //     values.setProductCheck();
                        //   },
                        //   shape: const RoundedRectangleBorder(
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(10.0))),
                        // ),
                        //const Text('Product')
                      ],
                    ),
                  ),
                  // !Provider.of<AddJobProvider>(context, listen: false)
                  //         .vendorSideTypeValidation
                  //     ? Consumer(
                  //         builder: (context, value, child) {
                  //           return const Text(
                  //             'Type is required',
                  //             style: TextStyle(color: Colors.red),
                  //           );
                  //         },
                  //       )
                  //     : const SizedBox(),
                  // TextFieldName(value: 'Category'),
                  // Consumer2<ExpertProvider, AddJobProvider>(
                  //     builder: (context, value, value2, child) {
                  //   return DropdownButtonFormField<job>(
                  //     value: value2.selectedCategory,
                  //     items: value2.categories
                  //         .map((category) => DropdownMenuItem<CategoryResModel>(
                  //               value: category,
                  //               child: Text(category!.name),
                  //             ))
                  //         .toList(),
                  //     onChanged: (CategoryResModel? category) {
                  //       value2.setCategory(category, category!.id,context);
                  //     },
                  //     validator: (value) {
                  //       if (value2.selectedCategory == null) {
                  //         return 'Category is required';
                  //       }
                  //       return null;
                  //     },
                  //     decoration: InputDecoration(
                  //       isDense: true,
                  //       prefixIcon: const Icon(Icons.category),
                  //       filled: true,
                  //       fillColor: Colors.white,
                  //       focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(15),
                  //           borderSide: const BorderSide(color: Colors.black)),
                  //       enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(15),
                  //           borderSide: const BorderSide(
                  //               color: Color.fromARGB(255, 123, 230, 219))),
                  //       hintStyle: const TextStyle(
                  //         color: Color.fromARGB(255, 111, 111, 111),
                  //       ),
                  //     ),
                  //   );
                  // }),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: context.watch<AddJobProvider>().hasListeners
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    saveButtonPressed();
                                  }
                                },
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    minimumSize: MaterialStatePropertyAll(
                                        Size(width / 1.1, 50)),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color.fromARGB(
                                                255, 123, 230, 219))),
                                child: Text(
                                  'Save',
                                  style: normalText,
                                )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: SizedBox(
            height: 50.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
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
        // galleryImage = imageTemp;
        // profile = galleryImage;
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
        //cameraImage = imageTemp;
        //profile = cameraImage;
      });
    } on PlatformException catch (e) {
      log(e.message.toString());
    }
  }

  void saveButtonPressed() async {
    // var title = titleController.text.trim();
    // var overView = overViewController.text.trim();
    // var description = descriptionController.text.trim();
    // var price = priceController.text.trim();
    // FlutterSecureStorage storage = const FlutterSecureStorage();
    // var vendorId = await storage.read(key: 'vendorId');
    // if (!_formKey.currentState!.validate()) {
    //   return;
    // }
    // // CloudinaryResponse response = await cloudinary.uploadFile(
    // //     CloudinaryFile.fromFile(widget.imagePath!.path,
    // //         resourceType: CloudinaryResourceType.Image));
    // // final url = response.secureUrl;
    // dynamic type;
    // if (context.read<NewGIgCreateProvider>().addserviceCheckBoxValue) {
    //   type = 'Service';

    // } else if (context.read<NewGIgCreateProvider>().addproductCheckBoxValue) {
    //   type = 'Product';
    // }
    // var gigCreateDatas = NewGigCreateModel(
    //     title: title,
    //     overview: overView,
    //     image: url,
    //     type: type,
    //     description: description,
    //     price: price,
    //     category: context.read<NewGIgCreateProvider>().selectedCategoryId,
    //     vendorId: vendorId.toString());
    //   await context.read<NewGIgCreateProvider>().createNewGig(gigCreateDatas, context);
    //   context.read<NewGIgCreateProvider>().getAllCategory(context);
    //   await Provider.of<ShowAllGigsProvider>(context,listen: false).callApiServiceGigs(context);
    //   Navigator.pop(context);
  }
}
