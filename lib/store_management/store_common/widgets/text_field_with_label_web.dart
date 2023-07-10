import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWithLabelWeb extends StatelessWidget {
  String label;
  double? textFieldWidth;
  String? initialValue;
  bool? canEdit;
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? Function(String?)? validator;

  TextFieldWithLabelWeb({
    required this.label,
    this.initialValue = '',
    this.canEdit = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textFieldWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        child: TextFormField(
          enabled: canEdit,
          initialValue: initialValue,
          // both initial value and controller can not be given at same time, one must be null
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: const TextStyle(
            fontSize: 16, //16
            color: const Color(0XFF3B3B3B),
            fontWeight: FontWeight.w300,
          ),
          decoration: InputDecoration(
            isDense: true,
            errorMaxLines: 2,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            filled: true,
            fillColor: const Color(0XFFF2F2F2),
            // isCollapsed: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    ]);
  }
}
