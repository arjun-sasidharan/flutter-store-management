import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarWeb extends StatelessWidget implements PreferredSizeWidget {
  double topPadding;
  GlobalKey<ScaffoldState> scaffoldKey;
  VoidCallback drawerIconOnClick;

  AppBarWeb(
      {Key? key,
      required this.scaffoldKey,
      required this.topPadding,
      required this.drawerIconOnClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        //height: 64.h,
        height: 64,
        decoration: const BoxDecoration(color: Color(0XFF2E6BDC)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0XFF2352A9),
                  ),
                  width: 64,
                  height: 64,
                  child: IconButton(
                    iconSize: 27.w,
                    onPressed: drawerIconOnClick,
                    //()
                    // {
                    //   // Scaffold.of(context).openDrawer(); when using single scaffold
                    //   // if (scaffoldKey.currentState?.isDrawerOpen == false) {
                    //   //   scaffoldKey.currentState?.openDrawer();
                    //   // } else {
                    //   //   scaffoldKey.currentState?.openEndDrawer();
                    //   // }
                    // },
                    icon: SvgPicture.asset(
                      "assets/icons/ic_spinningload2_outline.svg",
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 35.w,
                ),
                Row(
                  children: const [
                    Text(
                      'RIL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Assignment',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 333,
                  height: 36,
                  child: TextField(
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0XFF53626C)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0XFFEEF3FC),
                      // isCollapsed: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: SvgPicture.asset(
                          // height: 20.w,
                          // width: 20.w,
                          fit: BoxFit.cover,
                          clipBehavior: Clip.none,
                          "assets/icons/ic_search_outline.svg",
                          //color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 26.w,
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    // width: 27.w,
                    // height: 27.w,
                    "assets/icons/ic_notification_outline.svg",
                    //color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 23.w,
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/ic_logout_outline.svg",
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 80.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(topPadding + 64); // top padding + app bar size
}
