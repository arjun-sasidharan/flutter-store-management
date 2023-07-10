import 'package:flutter/material.dart';

class TextFieldWithLabelMobile extends StatelessWidget {
  String label;
  String? initialValue;
  bool? canEdit;
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? Function(String?)? validator;

  TextFieldWithLabelMobile({
    super.key,
    required this.label,
    this.initialValue = '',
    this.canEdit = false,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0XFF152235),
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          //height: 36,
          child: TextFormField(
            enabled: canEdit,
            initialValue: initialValue,
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0XFF152235),
              fontWeight: FontWeight.w300,
            ),
            decoration: InputDecoration(
              isDense: true,
              errorMaxLines: 2,
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0XFFB1B8BE),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0XFFB1B8BE),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
