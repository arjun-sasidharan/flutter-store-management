import 'package:flutter/material.dart';

class TopNavPathText extends StatelessWidget {
  const TopNavPathText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          'Home',
          style: TextStyle(
            fontSize: 15,
            color: Color(0XFF2E6BDC),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '>',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Store Management System',
          style: TextStyle(
            fontSize: 15,
            color: Color(0XFF2E6BDC),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
