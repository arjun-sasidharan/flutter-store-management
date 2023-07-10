import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../store_common/widgets/error_dialog.dart';
import '../../../../store_common/widgets/top_nav_path_text.dart';
import '../../../../store_common/widgets/list_divider.dart';
import 'product_list_item_mobile.dart';
import '../../../../store_common/widgets/loading_spinner.dart';
import '../../domain/store_data_model.dart';
import 'store_form_mobile.dart';
import '../../../../../home/presentation/custom_scaffold_mobile.dart';

// Controller
import '../../application/products_controller.dart';

class StoreMoreDetailsPageMobile extends StatelessWidget {
  Store store;

  StoreMoreDetailsPageMobile(this.store);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      debugPrint(
          'calling fetch product data after widget build, time stamp : $timeStamp');
      ProductsController productsController = Get.find<ProductsController>();
      // clearing product list first
      productsController.productsList = [];
      productsController.fetchProductsData(store.storeId!);
      // calling the fetch method
    });
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
                        // limiting the space the form can take
                        ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 400.h),
                          child: SingleChildScrollView(
                              child: StoreFormMobile(
                            store: store,
                            withInitialValue: true,
                          )),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        GetBuilder<ProductsController>(
                          builder: (productsControllerState) {
                            if (productsControllerState.isError) {
                              // show error dialog after widget build
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                showStoreFetchingErrorDialog(
                                    productsControllerState);
                              });
                            }
                            if (productsControllerState.isLoading) {
                              return const Expanded(
                                  child: Center(
                                child: LoadingSpinner(),
                              ));
                            }
                            if (productsControllerState.productsList!.isEmpty) {
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
                                            productsControllerState
                                                .productsList![i],
                                            i + 1),
                                    separatorBuilder: (ctx, i) =>
                                        const ListDivider(),
                                    itemCount: productsControllerState
                                        .productsList!.length,
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
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
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
                            child: const Text(
                              'Back',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
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

  showStoreFetchingErrorDialog(ProductsController productsController) {
    ErrorDialog errorDialog = ErrorDialog(
      message: 'Can not fetch products data',
      dialogBtnOnClick: () {
        // resetting isError, to make the dialog not show everytime before data fetch
        productsController.isError = false;
        // closing the dialog and navigating back
        Get.back();
      },
      error: productsController.errorMessage,
    );
    Get.dialog(
      errorDialog,
      barrierDismissible: false,
    );
  }
}
