import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../modules/store_home/domain/store_data_model.dart';

class DropdownFieldWithLabelWeb extends StatelessWidget {
  String label;
  double? textFieldWidth;
  String? initialValue;
  bool? canEdit;
  List<String>? items;
  List<Store>? storesList;
  Store? selectedStore;
  Object? selectedValue;
  Function(Object?)? onChanged;

  DropdownFieldWithLabelWeb({
    required this.label,
    this.initialValue = '',
    this.canEdit = false,
    this.items,
    this.storesList,
    this.selectedStore,
    this.selectedValue,
    this.onChanged,
    this.textFieldWidth,
  });

  DropdownMenuItem<String> buildMenuItem(Store storeItem) {
    return DropdownMenuItem(
      value: storeItem.storeId.toString(),
      child: Text(
        storeItem.storeName!,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0XFF3B3B3B),
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Color(0XFF2E6BDC)),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: textFieldWidth ?? 305.w,
          // height: 48,
          child: InputDecorator(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0XFFF2F2F2),
                isCollapsed: true,
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  icon: const Icon(
                    Icons.expand_more,
                    color: Color(0XFF3B5CFF),
                  ),
                  underline: null,
                  hint: const Text(
                    'Select',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0XFF3B3B3B),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  disabledHint: const Text(
                    'Select',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0XFF3B3B3B),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  isExpanded: true,
                  value: selectedValue,
                  // OLD method
                  // items: items == null
                  //     ? null
                  //     : items!.map((String items) {
                  //         return DropdownMenuItem(
                  //           value: items,
                  //           child: Text(items),
                  //         );
                  //       }).toList(),
                  items: storesList!.map(buildMenuItem).toList(),
                  onChanged: onChanged,
                ),
              ),
            ),
          ),

        // error: shadow around it when focused
        // SizedBox(
        //   width: 305.w,
        //   height: 48,
        //   child: DropdownButtonFormField(
        //       icon: const Icon(
        //         Icons.expand_more,
        //         color: Color(0XFF3B5CFF),
        //       ),
        //       hint: const Text(
        //         'Select',
        //         style: TextStyle(
        //           fontSize: 14,
        //           color: Color(0XFF3B3B3B),
        //           fontWeight: FontWeight.w300,
        //         ),
        //       ),
        //       isExpanded: true,
        //       decoration: InputDecoration(
        //         filled: true,
        //         fillColor: const Color(0XFFF2F2F2),
        //         // isCollapsed: true,
        //         contentPadding:
        //             const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //         border: OutlineInputBorder(
        //           borderSide: BorderSide.none,
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //       ),
        //       value: null,
        //       items:  storesList!.map(buildMenuItem).toList(),
        //       onChanged: (value) {}),
        // ),
      ],
    );
  }
}
