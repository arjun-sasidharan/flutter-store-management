import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../store_common/widgets/top_nav_path_text.dart';
import '../../../../store_common/widgets/list_divider.dart';
import '../../../../store_common/widgets/text_field_with_label_mobile.dart';
import '../../../../store_common/widgets/success_dialog.dart';
import '../../../../../home/presentation/custom_scaffold_mobile.dart';

// Controller
import '../../application/add_store_controller.dart';

class AddProductPageMobile extends StatelessWidget {
  AddProductPageMobile({Key? key}) : super(key: key);

  final productFormKeyLocal = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final double screenHeight = MediaQuery.of(context).size.height;
    // final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    const double gapBetweenItems = 10; // 15
    return CustomScaffoldMobile(
      resizeToAvoidBottomInset: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // to fix render issue when keyboard appear
        backgroundColor: const Color(0XFFF7F7F7),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40.w,
            vertical: 18,
          ),
          child: Column(
            children: [
              // top path item
              const TopNavPathText(),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SizedBox(
                  // height: 300,
                  width: double.infinity,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0XFFAFB4C5),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: GetBuilder<AddStoreController>(
                        builder: (addStoreController) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  'Store Management System',
                                  style: TextStyle(
                                    color: Color(0XFF2E6BDC),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const ListDivider(),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 16.0,
                                    left: 16.0,
                                    top: 16,
                                    bottom: 16),
                                child: Form(
                                  key: productFormKeyLocal,
                                  // using widget global form key
                                  // key: addStoreController.productFormKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Add',
                                        style: TextStyle(
                                          color: Color(0XFF2E6BDC),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFieldWithLabelMobile(
                                        label: 'Product ID',
                                        canEdit: true,
                                        initialValue: null,
                                        controller: addStoreController
                                            .productIdController,
                                        validator: addStoreController
                                            .productIdValidator,
                                        keyboardType: TextInputType.number,
                                      ),
                                      const SizedBox(
                                        height: gapBetweenItems,
                                      ),
                                      TextFieldWithLabelMobile(
                                        label: 'Product Name',
                                        canEdit: true,
                                        initialValue: null,
                                        controller: addStoreController
                                            .productNameController,
                                        validator: addStoreController
                                            .productNameValidator,
                                        keyboardType: TextInputType.text,
                                      ),
                                      const SizedBox(
                                        height: gapBetweenItems,
                                      ),
                                      TextFieldWithLabelMobile(
                                        label: 'Quantity',
                                        canEdit: true,
                                        initialValue: null,
                                        controller: addStoreController
                                            .productQuantityController,
                                        validator: addStoreController
                                            .productQuantityValidator,
                                        keyboardType: TextInputType.text,
                                      ),
                                      const SizedBox(
                                        height: gapBetweenItems,
                                      ),
                                      TextFieldWithLabelMobile(
                                        label: 'Vendor Details',
                                        canEdit: true,
                                        initialValue: null,
                                        controller: addStoreController
                                            .productVendorDetailsController,
                                        validator: addStoreController
                                            .productVendorDetailsValidator,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                      const SizedBox(
                                        height: gapBetweenItems,
                                      ),
                                      TextFieldWithLabelMobile(
                                        label: 'Price',
                                        canEdit: true,
                                        initialValue: null,
                                        controller: addStoreController
                                            .productPriceController,
                                        validator: addStoreController
                                            .productPriceValidator,
                                        keyboardType: TextInputType.number,
                                      ),
                                      // adding this for making the screen scrollable
                                      // so text field is visible when keyboard is opened
                                      const SizedBox(
                                        height: 150,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const ListDivider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // TODO: using widget global key for product form
                                    if (productFormKeyLocal.currentState!
                                        .validate()) {
                                      // hiding keyboard
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      // validation success, add product to list
                                      addStoreController
                                          .addProductToTheProductList();
                                      // showing success dialog
                                      showSuccessDialog(addStoreController);
                                    }
                                  },
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8)),
                                    minimumSize: const MaterialStatePropertyAll(
                                        Size(90, 40)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color(0XFF2E6BDC)),
                                  ),
                                  child: const Text(
                                    'Save',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    // hiding keyboard
                                    FocusScopeNode currentFocus =
                                        FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                    // clearing entries in the form
                                    addStoreController.clearProductForm();
                                    Get.back();
                                  },
                                  style: ButtonStyle(
                                    side: const MaterialStatePropertyAll(
                                        BorderSide(
                                      color: Color(0XFF2E6BDC),
                                      width: 1,
                                    )),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8)),
                                    minimumSize: const MaterialStatePropertyAll(
                                        Size(90, 40)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Colors.white),
                                  ),
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0XFF2E6BDC)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSuccessDialog(AddStoreController addStoreController) {
    SuccessDialog successDialog = SuccessDialog(
      'Data Added Successfully',
      () {
        // clearing form
        addStoreController.clearProductForm();
        // closing the dialog and navigating back
        Get.back(closeOverlays: true);
      },
    );
    Get.dialog(
      successDialog,
      barrierDismissible: false,
    );
  }
}
