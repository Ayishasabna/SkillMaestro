/* import 'dart:io';

import 'package:flutter/material.dart';
import 'package:skillmaestro/admin/model/all_jobs_response_model.dart';

class NewGIgCreateProvider with ChangeNotifier {
  List<JobListModel?> jobs = [];
  JobListModel? selectedJob;
    String gigImage = '';
  File? gigImageFile;
  dynamic selectedCategoryId;
  bool vendorSideTypeValidation = true;

  bool addserviceCheckBoxValue = false;
  bool addproductCheckBoxValue = false;

  bool editserviceCheckBoxValue = false;
  bool editproductCheckBoxValue = false;

  void setCategory(selectedCategoryValue, selectedCategoryIdValue,context) {
    selectedCategory = selectedCategoryValue;
    selectedCategoryId = selectedCategoryIdValue;
    notifyListeners();
          // context.read<NewGIgCreateProvider>().getAllCategory(context);

  }
  
   bool isLoading = false;
  Future<void> createNewGig(gigCreateDatas, context) async {
    isLoading = true;
    notifyListeners();
    var response = await NewGigCreateApiService().newGigCreate(gigCreateDatas);
    if (response == 'success') {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: 'New Gig Adding Successfull',
        ),
      );
    }
    isLoading =false;
    notifyListeners();
  }

  void setEditServiceCheck() {
    editserviceCheckBoxValue = !editserviceCheckBoxValue;
    editproductCheckBoxValue = !editserviceCheckBoxValue;
    notifyListeners();
  }
    void typeCheck(type) {
    if (type == 'Service') {
   editserviceCheckBoxValue = true;
    } else if (type == 'Product') {
editproductCheckBoxValue = true;
    }
    notifyListeners();
  }

  void setEditProductCheck() {
    editproductCheckBoxValue = !editproductCheckBoxValue;
    editserviceCheckBoxValue = !editproductCheckBoxValue;
    notifyListeners();
  }

  void setServiceCheck() {
    addserviceCheckBoxValue = !addserviceCheckBoxValue;
    addproductCheckBoxValue = !addserviceCheckBoxValue;
    notifyListeners();
  }

  void setProductCheck() {
    addproductCheckBoxValue = !addproductCheckBoxValue;
    addserviceCheckBoxValue = !addproductCheckBoxValue;
    notifyListeners();
  }

  Future<void> editGig(gigEditDatas, context) async {
    log('inside pro ');
    var response = await EditGigService().editGig(gigEditDatas);
    if (response == 'success') {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: 'Gig Editing Successfull',
        ),
      );
    }
  }

  Future<void> deleteGig(gigId, context) async {
    await DeleteGigService().deleteGig(gigId, context);
  }

  Future<void> getAllCategory(context) async {
    await NewGigCreateApiService()
        .getAllCategory(context)
        .then((categoriesValue) {
      categories = categoriesValue!;
      notifyListeners();

    });
  }
}
 */