import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_management_flutter/store_management/modules/store_home/application/add_store_controller.dart';

import '../../../../store_common/widgets/text_field_with_label_web.dart';
import '../../domain/store_data_model.dart';

class AddStoreFormWeb extends StatelessWidget {
  bool withInitialValue;
  bool? canEdit;

  AddStoreFormWeb({
    this.withInitialValue = false,
    this.canEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddStoreController>(
      builder: (addStoreController) {
        return Form(
          key: addStoreController.storeFormKey,
          child:  FittedBox(
            fit: BoxFit.fitWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextFieldWithLabelWeb(
                  label: 'Store ID',
                  canEdit: canEdit,
                  initialValue: null,
                  controller: addStoreController.storeIdController,
                  keyboardType: TextInputType.number,
                  validator: addStoreController.storeIdValidator,
                ),
                SizedBox(
                  width: 30.h,
                ),
                TextFieldWithLabelWeb(
                  label: 'Store Name',
                  canEdit: canEdit,
                  initialValue: null,
                  controller: addStoreController.storeNameController,
                  validator: addStoreController.storeNameValidator,
                ),
                SizedBox(
                  width: 30.h,
                ),
                TextFieldWithLabelWeb(
                  label: 'Domain ID',
                  canEdit: canEdit,
                  initialValue: null,
                  controller: addStoreController.storeDomainIdController,
                  keyboardType: TextInputType.url,
                  validator: addStoreController.storeDomainIdValidator,
                ),
                SizedBox(
                  width: 30.h,
                ),
                TextFieldWithLabelWeb(
                  label: 'Est. Year',
                  canEdit: canEdit,
                  initialValue: null,
                  controller: addStoreController.storeYearController,
                  validator: addStoreController.yearValidator,
                ),
                SizedBox(
                  width: 30.h,
                ),
                TextFieldWithLabelWeb(
                  label: 'Headquarter Location',
                  canEdit: canEdit,
                  initialValue: null,
                  controller: addStoreController.storeLocationController,
                  validator: addStoreController.locationValidator,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
