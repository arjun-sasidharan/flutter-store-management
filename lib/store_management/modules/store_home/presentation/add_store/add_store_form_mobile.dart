import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../application/add_store_controller.dart';
import '../../../../store_common/widgets/text_field_with_label_mobile.dart';


class AddStoreFormMobile extends StatelessWidget {
  bool withInitialValue;
  bool? canEdit;
  GlobalKey<FormState>? formKey;

  AddStoreFormMobile({
    this.withInitialValue = false,
    this.canEdit = false,
    this.formKey,
  });



  @override
  Widget build(BuildContext context) {
    const double gapBetweenItems = 10; // 15
    return Padding(
      padding:
      const EdgeInsets.only(right: 16.0, left: 16.0, top: 16, bottom: 8),
      child: GetBuilder<AddStoreController>(
          builder: (addStoreController) {
            return Form(
               key: formKey, //  using local widget global key
               // key: addStoreController.storeFormKey,
              //onChanged: addStoreController.saveStoreData,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldWithLabelMobile(
                    label: 'Store ID',
                    canEdit: canEdit,
                    initialValue: null,
                    controller: addStoreController.storeIdController,
                    keyboardType: TextInputType.number,
                    validator: addStoreController.storeIdValidator,
                  ),
                  const SizedBox(
                    height: gapBetweenItems,
                  ),
                  TextFieldWithLabelMobile(
                    label: 'Store Name',
                    canEdit: canEdit,
                    initialValue: null,
                    controller: addStoreController.storeNameController,
                    validator: addStoreController.storeNameValidator,
                  ),
                  const SizedBox(
                    height: gapBetweenItems,
                  ),
                  TextFieldWithLabelMobile(
                    label: 'Domain ID',
                    canEdit: canEdit,
                    initialValue: null,
                    controller: addStoreController.storeDomainIdController,
                    keyboardType: TextInputType.url,
                    validator: addStoreController.storeDomainIdValidator,
                  ),
                  const SizedBox(
                    height: gapBetweenItems,
                  ),
                  TextFieldWithLabelMobile(
                    label: 'Established Year',
                    canEdit: canEdit,
                    initialValue: null,
                    controller: addStoreController.storeYearController,
                    validator: addStoreController.yearValidator,
                  ),
                  const SizedBox(
                    height: gapBetweenItems,
                  ),
                  TextFieldWithLabelMobile(
                    label: 'Headquarter Location',
                    canEdit: canEdit,
                    initialValue: null,
                    controller: addStoreController.storeLocationController,
                    validator: addStoreController.locationValidator,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
