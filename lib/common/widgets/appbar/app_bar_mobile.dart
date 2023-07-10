import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarMobile extends StatelessWidget implements PreferredSizeWidget {
  final double topPadding;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AppBarMobile(
      {Key? key, required this.scaffoldKey, required this.topPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
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
                    onPressed: () {
                      // Scaffold.of(context).openDrawer(); // normal scaffold
                      if (scaffoldKey.currentState?.isDrawerOpen == false) {
                        scaffoldKey.currentState?.openDrawer();
                      } else {
                        scaffoldKey.currentState?.openEndDrawer();
                      }
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/ic_spinningload2_outline.svg",
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 35,
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
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/ic_logout_outline.svg",
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 17,
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
