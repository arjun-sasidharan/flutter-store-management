import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessDialog extends StatelessWidget {
  String message;
  VoidCallback dialogBtnOnClick;

  SuccessDialog(this.message, this.dialogBtnOnClick);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
         // height: 276,
          width: 328,
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/success-icon-10@2x.png",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 36.h,
            ),
            Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            ElevatedButton(
              onPressed: dialogBtnOnClick,
              //     () {
              //   // Navigator.of(context).pop(); // removing the dialog
              //
              // },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8)),
                minimumSize: const MaterialStatePropertyAll(Size(136, 40)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor:
                    const MaterialStatePropertyAll(Color(0XFF2E6BDC)),
              ),
              child: const Text(
                'OK',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
