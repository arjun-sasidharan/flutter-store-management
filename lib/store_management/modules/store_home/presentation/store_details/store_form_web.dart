import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../store_common/widgets/text_field_with_label_web.dart';
import '../../domain/store_data_model.dart';

class StoreFormWeb extends StatelessWidget {
  Store? store;
  bool withInitialValue;
  bool? canEdit;

  StoreFormWeb({
    this.store,
    this.withInitialValue = false,
    this.canEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextFieldWithLabelWeb(
              label: 'Store ID',
              canEdit: canEdit,
              initialValue: withInitialValue ? '${store!.storeId}' : null,
            ),
            SizedBox(
              width: 30.h,
            ),
            TextFieldWithLabelWeb(
              label: 'Store Name',
              canEdit: canEdit,
              initialValue: withInitialValue ? '${store!.storeName}' : null,
            ),
            SizedBox(
              width: 30.h,
            ),
            TextFieldWithLabelWeb(
              label: 'Domain ID',
              canEdit: canEdit,
              initialValue: withInitialValue ? '${store!.domainId}' : null,
            ),
            SizedBox(
              width: 30.h,
            ),
            TextFieldWithLabelWeb(
              label: 'Est. Year',
              canEdit: canEdit,
              initialValue: withInitialValue ? '${store!.establishYear}' : null,
            ),
            SizedBox(
              width: 30.h,
            ),
            TextFieldWithLabelWeb(
              label: 'Headquarter Location',
              canEdit: canEdit,
              initialValue: withInitialValue ? '${store!.location}' : null,
            ),
          ],
        ),
      ),
    );
  }
}
