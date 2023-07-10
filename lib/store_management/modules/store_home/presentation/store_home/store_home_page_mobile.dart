import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_management_flutter/store_management/modules/store_home/presentation/add_store/add_store_page_mobile.dart';

import '../../../../store_common/widgets/error_dialog.dart';
import '../../application/add_store_controller.dart';
import '../../application/products_controller.dart';
import '../../application/stores_controller.dart';
import '../../../../store_common/widgets/top_nav_path_text.dart';
import '../../../../store_common/widgets/list_divider.dart';
import 'store_list_item_mobile.dart';
import '../../../../store_common/widgets/loading_spinner.dart';
import '../../../../../home/presentation/custom_scaffold_mobile.dart';

class StoreHomePageMobile extends StatelessWidget {
  StoreHomePageMobile({Key? key}) : super(key: key);

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
    return CustomScaffoldMobile(
      child: Scaffold(
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
                  width: double.infinity,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0XFFAFB4C5),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
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
                        GetBuilder<StoresController>(
                            builder: (storesControllerState) {
                          if (storesController.isError) {
                            // show error dialog after widget build
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              showStoreFetchingErrorDialog(storesController);
                            });
                          }
                          if (storesControllerState.isLoading) {
                            return const Expanded(
                                child: Center(
                              child: LoadingSpinner(),
                            ));
                          }
                          if (storesControllerState.storesList.isEmpty) {
                            return const Expanded(
                                child: Center(
                                    child: Text('Stores data not available')));
                          } else {
                            return Expanded(
                              child: SizedBox(
                                // height: 500.h,
                                child: ListView.separated(
                                  //shrinkWrap: true,
                                  itemBuilder: (ctx, i) => StoreListItemMobile(
                                      storesControllerState.storesList[i],
                                      i + 1),
                                  separatorBuilder: (ctx, i) =>
                                      const ListDivider(),
                                  itemCount:
                                      storesControllerState.storesList.length,
                                ),
                              ),
                            );
                          }
                        }),
                        const ListDivider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Get.to(() => AddStorePageMobile());
                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                            ),
                            label: const Text(
                              'Create New',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8)),
                              minimumSize:
                                  const MaterialStatePropertyAll(Size(139, 40)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color(0XFF2E6BDC)),
                            ),
                          ),
                        ),
                      ],
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
