import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../application/add_store_controller.dart';
import '../../../../store_common/widgets/text_field_with_label_web.dart';

class AddProductFormWeb extends StatelessWidget {
  const AddProductFormWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 16,
      ),
      child: GetBuilder<AddStoreController>(builder: (addStoreControllerState) {
        return Form(
          key: addStoreControllerState.productFormKey,
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldWithLabelWeb(
                    label: 'Product ID',
                    textFieldWidth: 380.w,
                    canEdit: true,
                    initialValue: null,
                    controller: addStoreControllerState.productIdController,
                    validator: addStoreControllerState.productIdValidator,
                  ),
                  TextFieldWithLabelWeb(
                    label: 'Product Name',
                    textFieldWidth: 380.w,
                    canEdit: true,
                    initialValue: null,
                    controller: addStoreControllerState.productNameController,
                    validator: addStoreControllerState.productNameValidator,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldWithLabelWeb(
                    label: 'Quantity',
                    textFieldWidth: 380.w,
                    canEdit: true,
                    initialValue: null,
                    controller:
                        addStoreControllerState.productQuantityController,
                    validator: addStoreControllerState.productQuantityValidator,
                  ),
                  TextFieldWithLabelWeb(
                    label: 'Price',
                    textFieldWidth: 380.w,
                    canEdit: true,
                    initialValue: null,
                    controller: addStoreControllerState.productPriceController,
                    validator: addStoreControllerState.productPriceValidator,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextFieldWithLabelWeb(
                label: 'Vendor Details',
                textFieldWidth: 500.w,
                canEdit: true,
                initialValue: null,
                controller:
                    addStoreControllerState.productVendorDetailsController,
                validator:
                    addStoreControllerState.productVendorDetailsValidator,
              ),
            ],
          ),
        );
      }),
    );
  }

}
