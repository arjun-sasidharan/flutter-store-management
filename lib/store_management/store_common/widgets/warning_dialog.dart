import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WarningDialog extends StatelessWidget {
  String message;
  VoidCallback yesBtnOnClick;
  VoidCallback noBtnOnClick;

  WarningDialog(this.message, this.yesBtnOnClick, this.noBtnOnClick);

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
            SvgPicture.asset(
              "assets/icons/ic_warning.svg",
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 36.h,
            ),
            Text(
              message,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: yesBtnOnClick,
                  //     () {
                  //   // Navigator.of(context).pop(); // removing the dialog
                  //
                  // },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8)),
                    minimumSize: const MaterialStatePropertyAll(Size(93, 40)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0XFF2E6BDC)),
                  ),
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                OutlinedButton(
                  onPressed: noBtnOnClick,
                  //     () {
                  //   // Navigator.of(context).pop(); // removing the dialog
                  //
                  // },
                  style: ButtonStyle(
                    side: const MaterialStatePropertyAll(BorderSide(
                      color: Color(0XFF2E6BDC),
                      width: 1,
                    )),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8)),
                    minimumSize: const MaterialStatePropertyAll(Size(93, 40)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                  ),
                  child: const Text(
                    'No',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0XFF2E6BDC),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
