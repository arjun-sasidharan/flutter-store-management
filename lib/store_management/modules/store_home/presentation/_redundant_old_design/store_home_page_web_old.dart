import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'store_form_web_old.dart';
import 'products_table_web_old.dart';

// Controller
import '../../application/stores_controller.dart';
import '../../application/products_controller.dart';
import '../../application/add_store_controller.dart';
import '../add_store/add_product_dialog_web.dart';

class StoreHomePageWebOld extends StatelessWidget {
  StoreHomePageWebOld({Key? key}) : super(key: key);

  // Dependency injection
  // permanent is true, so it will not be deleted in next page
  StoresController storesController = Get.put(StoresController(),
      permanent: true); // stores controller dependency injection
  ProductsController productsController = Get.put(ProductsController(),
      permanent: true); // products controller dependency injection
  AddStoreController addStoreController = Get.put(AddStoreController(),
      permanent: true); // products controller dependency injection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: GetBuilder<StoresController>(
                      //init: StoresController(), // not needed, because it is specified as dependency
                      autoRemove: false,
                      builder: (storesControllerState) {
                        return Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const StoreFormWebOld(),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton.icon(
                                    onPressed: () {
                                      // check if store is selected
                                      if (storesControllerState.selectedStore !=
                                          null) {
                                        // TODO: check if products are loaded
                                        // opening dialog
                                        Get.dialog(
                                          AddProductDialogWeb(),
                                          barrierDismissible: true,
                                        );
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      color: Color(0XFF2E6BDC),
                                    ),
                                    label: const Text(
                                      'Create New',
                                      style:
                                          TextStyle(color: Color(0XFF2E6BDC)),
                                    )),
                                SizedBox(
                                  width: 30.w,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: const ProductsTableWebOld(),
                            ),
                            // const SizedBox(
                            //   height: 300,
                            // )
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
    );
  }
}
