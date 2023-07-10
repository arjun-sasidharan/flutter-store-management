import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../store_common/widgets/list_divider.dart';
import '../../../../store_common/widgets/success_dialog.dart';
import '../../application/add_store_controller.dart';
import 'add_product_form_web.dart';

class AddProductDialogWeb extends StatelessWidget {
  const AddProductDialogWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 906.w,
            constraints: BoxConstraints(
              minWidth: 906.w,
              // minHeight: 636.h,
            ),
            // height: 276,
            // width: 328,

            padding: const EdgeInsets.only(
              top: 30,
              // bottom: 20,
              // right: 18,
              // left: 18,
            ),
            child: GetBuilder<AddStoreController>(
                builder: (addStoreControllerState) {
              return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Add',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const ListDivider(),
                    const AddProductFormWeb(),
                    const ListDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // validate
                              if (addStoreControllerState
                                  .productFormKey.currentState!
                                  .validate()) {
                                // validation success, add product to list
                                addStoreControllerState
                                    .addProductToTheProductList();
                                //TODO:
                                Get.back(); // closing the add product dialog
                                // showing success dialog
                                showSuccessDialog(addStoreControllerState);
                              }
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8)),
                              minimumSize:
                                  const MaterialStatePropertyAll(Size(90, 40)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color(0XFF2E6BDC)),
                            ),
                            child: const Text(
                              'Save',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          OutlinedButton(
                            onPressed: () {
                              // clearing entries in the form
                              addStoreControllerState.clearProductForm();
                              Get.back();
                            },
                            style: ButtonStyle(
                              side: const MaterialStatePropertyAll(BorderSide(
                                color: Color(0XFF2E6BDC),
                                width: 1,
                              )),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8)),
                              minimumSize:
                                  const MaterialStatePropertyAll(Size(90, 40)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.white),
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
                  ]);
            }),
          ),
          Positioned(
            top: -25,
            right: 0,
            child: InkWell(
              onTap: () {
                Get.back(closeOverlays: true);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Close',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Icon(
                      Icons.close_outlined,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  showSuccessDialog(AddStoreController addStoreController) {
    SuccessDialog successDialog = SuccessDialog(
      'Data Added Successfully',
      () {
        // clearing form
        addStoreController.clearProductForm();
        // closing the dialog
        Get.back();
      },
    );
    Get.dialog(
      successDialog,
      barrierDismissible: false,
    );
  }
}
