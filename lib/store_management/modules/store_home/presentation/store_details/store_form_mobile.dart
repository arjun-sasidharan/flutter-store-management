import 'package:flutter/material.dart';


import '../../domain/store_data_model.dart';
import '../../../../store_common/widgets/text_field_with_label_mobile.dart';


class StoreFormMobile extends StatelessWidget {
  Store? store;
  bool withInitialValue;
  bool? canEdit;

  StoreFormMobile({
    this.store,
    this.withInitialValue = false,
    this.canEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    const double gapBetweenItems = 10; // 15
    return Padding(
      padding:
          const EdgeInsets.only(right: 16.0, left: 16.0, top: 16, bottom: 8),
      child: Form(
          // autovalidateMode: AutovalidateMode.always,
          //onChanged: addStoreController.saveStoreData,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWithLabelMobile(
                label: 'Store ID',
                initialValue: withInitialValue ? '${store!.storeId}' : null,
                canEdit: canEdit,
              ),
              const SizedBox(
                height: gapBetweenItems,
              ),
              TextFieldWithLabelMobile(
                label: 'Store Name',
                initialValue: withInitialValue ? '${store!.storeName}' : null,
                canEdit: canEdit,
              ),
              const SizedBox(
                height: gapBetweenItems,
              ),
              TextFieldWithLabelMobile(
                label: 'Established Year',
                initialValue:
                    withInitialValue ? '${store!.establishYear}' : null,
                canEdit: canEdit,
              ),
              const SizedBox(
                height: gapBetweenItems,
              ),
              TextFieldWithLabelMobile(
                label: 'Domain ID',
                initialValue: withInitialValue ? '${store!.domainId}' : null,
                canEdit: canEdit,
              ),
              const SizedBox(
                height: gapBetweenItems,
              ),
              TextFieldWithLabelMobile(
                label: 'Headquarter Location',
                initialValue: withInitialValue ? '${store!.location}' : null,
                canEdit: canEdit,
              ),
            ],
          ),
        )
    );
  }
}
