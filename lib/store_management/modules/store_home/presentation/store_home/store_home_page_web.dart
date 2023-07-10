import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../home/presentation/custom_scaffold_web.dart';
import '../../../../store_common/widgets/error_dialog.dart';
import '../add_store/add_store_page_web.dart';
import './stores_table_web.dart';

// Controller
import '../../application/stores_controller.dart';
import '../../application/products_controller.dart';
import '../../application/add_store_controller.dart';

class StoreHomePageWeb extends StatelessWidget {
  StoreHomePageWeb({Key? key}) : super(key: key);

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
    debugPrint('on store home build method');
    //storesController.fetchStoresData();
    if (Get.arguments == 'store_added') {
      debugPrint('in home screen, store added');
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        debugPrint(
            'calling fetch store data after widget build, time stamp : $timeStamp');
        storesController.fetchStoresData();
      });
    }
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
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 40,
                    ),
                    child: GetBuilder<StoresController>(
                        autoRemove: false,
                        builder: (storesControllerState) {
                          if (storesController.isError) {
                            // show error dialog after widget build
                            WidgetsBinding.instance
                                .addPostFrameCallback((_) {
                              showStoreFetchingErrorDialog(storesController);
                            });
                          }
                          return Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const StoresTableWeb(),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      Get.to(() => const AddStorePageWeb(),
                                          routeName:
                                              'store_management/add-store');
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.white,
                                    ),
                                    label: const Text(
                                      'Create New',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8)),
                                      minimumSize:
                                          const MaterialStatePropertyAll(
                                              Size(138, 40)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Color(0XFF2E6BDC)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                ],
                              ),
                              // const SizedBox(
                              //   height: 300,
                              // )
                            ],
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showStoreFetchingErrorDialog(StoresController storesController) {
    ErrorDialog errorDialog = ErrorDialog(
      message: 'Can not fetch store data',
      dialogBtnOnClick: () {
        // resetting isError, to make the dialog not show everytime before data fetch
        storesController.isError = false;
        // closing the dialog and navigating back
        Get.back();
      },
      error: storesController.errorMessage,
    );
    Get.dialog(
      errorDialog,
      barrierDismissible: false,
    );
  }
}
