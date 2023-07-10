import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../home/presentation/custom_scaffold_web.dart';
import '../../../../store_common/widgets/error_dialog.dart';
import '../../../../store_common/widgets/loading_spinner.dart';
import '../../../../store_common/widgets/success_dialog.dart';
import '../../../../store_common/widgets/warning_dialog.dart';
import '../store_home/store_home_page.dart';
import 'add_product_dialog_web.dart';
import 'add_store_form_web.dart';
import 'products_table_with_action_web.dart';

// Controller
import '../../application/add_store_controller.dart';

class AddStorePageWeb extends StatelessWidget {
  const AddStorePageWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWeb(
      child: Scaffold(
        backgroundColor: const Color(0XFFF7F7F7),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40.w,
              vertical: 18,
            ),
            child: Column(
              children: [
                // top path item
                Row(
                  children: const [
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0XFF2E6BDC),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '>',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Store Management System',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0XFF2E6BDC),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 48,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  // to align with card
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    color: Color(0XFF2E6BDC),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                    ),
                  ),
                  child: const Text(
                    'Store Management System',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Expanded(
                //   child:
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                    child: GetBuilder<AddStoreController>(
                        builder: (addStoreController) {
                      bool isProductAdded =
                          addStoreController.newProductsList.isNotEmpty;
                      bool isStoreDataAdded =
                          addStoreController.isStoreDataAdded();
                      return Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AddStoreFormWeb(
                              canEdit: true, withInitialValue: false),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton.icon(
                                  onPressed: () {
                                    // store data not validating now
                                    Get.dialog(
                                      const AddProductDialogWeb(),
                                      barrierDismissible: true,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    color: Color(0XFF2E6BDC),
                                  ),
                                  label: const Text(
                                    'Add',
                                    style: TextStyle(color: Color(0XFF2E6BDC)),
                                  )),
                              // SizedBox(
                              //   width: 30.w,
                              // ),
                            ],
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          // const ProductsTableWebOld(),
                          const ProductsTableWithActionWeb(),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  isStoreDataAdded =
                                      addStoreController.isStoreDataAdded();
                                  if (isStoreDataAdded || isProductAdded) {
                                    // show warning
                                    showUnsavedDataWarning(addStoreController);
                                  } else {
                                    Get.back();
                                  }
                                },
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8)),
                                  minimumSize: const MaterialStatePropertyAll(
                                      Size(125, 40)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Color(0XFF2E6BDC)),
                                ),
                                child: const Text(
                                  'Back',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              ElevatedButton(
                                onPressed: isProductAdded
                                    ? () {
                                        // reset store form and product list
                                        // show warning
                                        showClearAllWarning(addStoreController);
                                      }
                                    : null,
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8)),
                                  minimumSize: const MaterialStatePropertyAll(
                                      Size(125, 40)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  backgroundColor: MaterialStatePropertyAll(
                                      isProductAdded
                                          ? const Color(0XFF2E6BDC)
                                          : const Color(0XFFBFBFBF)),
                                ),
                                child: const Text(
                                  'Reset',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              ElevatedButton(
                                onPressed: isProductAdded
                                    ? () {
                                        if (addStoreController
                                                .storeFormKey.currentState!
                                                .validate() &&
                                            isProductAdded) {
                                          saveStoreData(addStoreController);
                                        }
                                      }
                                    : null,
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8)),
                                  minimumSize: const MaterialStatePropertyAll(
                                      Size(125, 40)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  backgroundColor: MaterialStatePropertyAll(
                                      isProductAdded
                                          ? const Color(0XFF2E6BDC)
                                          : const Color(0XFFBFBFBF)),
                                ),
                                child: const Text(
                                  'Save',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    }),
                  ),
                ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  saveStoreData(AddStoreController addStoreController) async {
    // show loading indicator dialog
    showOverlayCircularIndicator();
    try {
      debugPrint('in try method');
      var saveSuccess = await addStoreController.saveStoreData();
      if (saveSuccess) {
        debugPrint('save operation success');
        // close loading spinner dialog
        Get.back();
        // show success dialog
        showSaveSuccessDialog(addStoreController);
      } else {
        debugPrint('save operation failed');
        // close loading spinner dialog
        Get.back();
        // showing error dialog
        showSaveErrorDialog(addStoreController.errorMessage);
      }
    } catch (error) {
      debugPrint('Caught error: $error');
    }
  }

  showClearAllWarning(AddStoreController addStoreController) {
    WarningDialog warningDialog = WarningDialog(
      'You are about to clear the screen, do you want to continue?',
      () {
        // clearing store form and product list
        addStoreController.clearAll();
        // closing the dialog
        Get.back();
      },
      () {
        // closing the dialog
        Get.back();
      },
    );
    Get.dialog(
      warningDialog,
      barrierDismissible: false,
    );
  }

  showUnsavedDataWarning(AddStoreController addStoreController) {
    WarningDialog warningDialog = WarningDialog(
      'Any Unsaved Data will be lost, do you want to continue?',
      () {
        // yes, close dialog and nav back
        addStoreController.clearAll();
        Get.back(closeOverlays: true);
      },
      () {
        //no,  closing the dialog
        Get.back();
      },
    );
    Get.dialog(
      warningDialog,
      barrierDismissible: false,
    );
  }

  showSaveSuccessDialog(AddStoreController addStoreController) {
    SuccessDialog successDialog = SuccessDialog(
      'Record Saved Successfully',
      () {
        // clearing store form and product list
        addStoreController.clearAll();
        // closing the dialog and navigating back
        //Get.back(closeOverlays: true);
        Get.toNamed(StoreHomepage.routeName, arguments: 'store_added');
      },
    );
    Get.dialog(
      successDialog,
      barrierDismissible: false,
    );
  }

  showSaveErrorDialog(String? error) {
    ErrorDialog errorDialog = ErrorDialog(
      message: 'Record Saving Failed',
      dialogBtnOnClick: () {
        // closing the dialog and navigating back
        Get.back();
      },
      error: error,
    );
    Get.dialog(
      errorDialog,
      barrierDismissible: false,
    );
  }

  showOverlayCircularIndicator() {
    Get.dialog(
      name: 'loading_spinner_overlay',
      const Center(child: LoadingSpinner()),
      barrierDismissible: false,
    );
  }
}
