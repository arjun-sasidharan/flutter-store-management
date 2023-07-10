import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../store_common/widgets/error_dialog.dart';
import '../../../../store_common/widgets/top_nav_path_text.dart';
import '../../../../store_common/widgets/list_divider.dart';
import '../store_details/product_list_item_mobile.dart';
import '../../../../store_common/widgets/loading_spinner.dart';
import '../store_home/store_home_page.dart';
import './add_store_form_mobile.dart';
import './add_product_page_mobile.dart';
import '../../../../store_common/widgets/warning_dialog.dart';
import '../../../../store_common/widgets/success_dialog.dart';
import '../../../../../home/presentation/custom_scaffold_mobile.dart';

// Controller
import '../../application/add_store_controller.dart';

class AddStorePageMobile extends StatelessWidget {
  AddStorePageMobile();

  final storeFormKeyLocal = GlobalKey<FormState>(); // local global key


  @override
  Widget build(BuildContext context) {
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
                        bool isProductAdded =
                            addStoreController.newProductsList.isNotEmpty;
                        bool isStoreDataAdded =
                            addStoreController.isStoreDataAdded();
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
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
                            // limiting the space the form can take
                            ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: 400.h),
                              child: SingleChildScrollView(
                                child: AddStoreFormMobile(
                                  withInitialValue: false,
                                  canEdit: true,
                                  formKey: storeFormKeyLocal,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 16.0, left: 16.0, top: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton.icon(
                                      onPressed: () {
                                        // not validating store now
                                        // hiding keyboard
                                        FocusScopeNode currentFocus =
                                            FocusScope.of(context);
                                        if (!currentFocus.hasPrimaryFocus) {
                                          currentFocus.unfocus();
                                        }
                                        Get.to(() => AddProductPageMobile());
                                      },
                                      icon: const Icon(
                                        Icons.add_circle_outline,
                                        color: Color(0XFF2E6BDC),
                                      ),
                                      label: const Text(
                                        'Add',
                                        style: TextStyle(
                                          color: Color(0XFF2E6BDC),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (addStoreController.isLoading) {
                                  return const Expanded(
                                      child: Center(
                                    child: LoadingSpinner(),
                                  ));
                                }
                                if (addStoreController
                                    .newProductsList.isEmpty) {
                                  return const Expanded(
                                    child: Center(
                                      child: Text('No products data'),
                                    ),
                                  );
                                } else {
                                  return Expanded(
                                    child: SizedBox(
                                      height: 300.h,
                                      child: ListView.separated(
                                        // shrinkWrap: true,
                                        itemBuilder: (ctx, i) =>
                                            ProductListItemMobile(
                                                addStoreController
                                                    .newProductsList[i],
                                                i + 1),
                                        separatorBuilder: (ctx, i) =>
                                            const ListDivider(),
                                        itemCount: addStoreController
                                            .newProductsList.length,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            const ListDivider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // hiding keyboard
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
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
                                      minimumSize:
                                          const MaterialStatePropertyAll(
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
                                      'Back',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: isProductAdded
                                        ? () {
                                            // hiding keyboard
                                            FocusScopeNode currentFocus =
                                                FocusScope.of(context);
                                            if (!currentFocus.hasPrimaryFocus) {
                                              currentFocus.unfocus();
                                            }
                                            // reset store form and product list
                                            // show warning
                                            showClearAllWarning(
                                                addStoreController);
                                          }
                                        : null,
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8)),
                                      minimumSize:
                                          const MaterialStatePropertyAll(
                                              Size(90, 40)),
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
                                  ElevatedButton(
                                    onPressed: isProductAdded
                                        ? () {
                                      // TODO: using widget global key for form
                                            if (storeFormKeyLocal.currentState!
                                                    .validate() &&
                                                isProductAdded) {
                                              // hiding keyboard
                                              FocusScopeNode currentFocus =
                                                  FocusScope.of(context);
                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                              saveStoreData(addStoreController);
                                            }
                                          }
                                        : null,
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8)),
                                      minimumSize:
                                          const MaterialStatePropertyAll(
                                              Size(90, 40)),
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
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
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
        // clearing store form and product list
        addStoreController.clearAll();
        // yes, close dialog and nav back
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
        // Get.back(closeOverlays: true);
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
      const Center(child: LoadingSpinner()),
      barrierDismissible: false,
    );
  }

  disposeFormState(AddStoreController addStoreController) {
    addStoreController.storeFormKey.currentState!.dispose();
  }

}
