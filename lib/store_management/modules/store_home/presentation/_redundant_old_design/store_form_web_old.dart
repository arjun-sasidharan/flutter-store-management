import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../application/stores_controller.dart';
import '../../application/products_controller.dart';

import '../../../../store_common/widgets/text_field_with_label_web.dart';
import '../../../../store_common/widgets/dropdown_field_with_label_web.dart';

class StoreFormWebOld extends StatelessWidget {
  const StoreFormWebOld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoresController>(
        // already initialized in parent widget
        builder: (storesControllerState) {
      return Column(
        children: [
          Form(
            child: FittedBox(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownFieldWithLabelWeb(
                    label: 'Store Name',
                    storesList: storesControllerState.storesList,
                    selectedStore: storesControllerState.selectedStore,
                    selectedValue: storesControllerState.selectedValue,
                    onChanged: storesControllerState.selectStore,
                    // items: storesController.storesList!.isEmpty ? List.generate(1, (index) => 'Not Available') :  storesController.storesList!.map((stores) => stores.storeName!).toList(),
                  ),
                  SizedBox(
                    width: 30.h,
                  ),
                  TextFieldWithLabelWeb(
                    label: 'Domain ID',
                    canEdit: false,
                    initialValue: null,
                    controller: storesControllerState.storeDomainIdController,
                  ),
                  SizedBox(
                    width: 30.h,
                  ),
                  TextFieldWithLabelWeb(
                    label: 'Established Year',
                    canEdit: false,
                    initialValue: null,
                    controller: storesControllerState.storeYearController,
                  ),
                  SizedBox(
                    width: 30.h,
                  ),
                  TextFieldWithLabelWeb(
                    label: 'Headquarter Location',
                    canEdit: false,
                    initialValue: null,
                    controller: storesControllerState.storeLocationController,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 31.h,
          ),
          GetBuilder<ProductsController>(builder: (productsControllerState) {
            bool isProductLoaded =
                productsControllerState.productsList!.isNotEmpty;
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // checking if store is selected
                    if (storesControllerState.selectedStore != null) {
                      productsControllerState.fetchProductsData(
                          storesControllerState.selectedStore!.storeId!);
                      debugPrint(
                          'view details btn clicked, selected store: ${storesControllerState.selectedStore!.storeName}');
                    } else {
                      debugPrint(
                          'view details btn clicked, but no store is selected');
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: const MaterialStatePropertyAll(
                      Size(136, 40),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    //padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0XFF2E6BDC)),
                  ),
                  child: const Text(
                    'View Details',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 22,
                ),
                ElevatedButton(
                  onPressed: isProductLoaded
                      ? () {
                          storesControllerState.clearStoreForm();
                          productsControllerState.clearProductsList();
                        }
                      : null,
                  style: ButtonStyle(
                    minimumSize: const MaterialStatePropertyAll(
                      Size(139, 40),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    //padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0)),
                    backgroundColor: MaterialStatePropertyAll(isProductLoaded
                        ? const Color(0XFF2E6BDC)
                        : const Color(0XFFDEDEDE)), //0XFFDEDEDE
                  ),
                  child: const Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
              ],
            );
          }),
        ],
      );
    });
  }
}
