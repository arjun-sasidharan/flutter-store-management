import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../other_1/other1_page.dart';
import '../../../other_2/other2_page.dart';
import '../../../store_management/modules/store_home/presentation/store_home/store_home_page.dart';

class DrawerWeb extends StatelessWidget {
  final List<String> drawerItemList;
  String selectedDrawerItem;
  final Function changeSelectedItem;

  DrawerWeb({
    Key? key,
    required this.drawerItemList,
    required this.selectedDrawerItem,
    required this.changeSelectedItem,
  }) : super(key: key);

  InkWell _normalItemTile(String title, BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('title: $title');
        if (title.contains('Store Management System')) {
          Get.offAllNamed(StoreHomepage.routeName);
        } else if (title.contains('Other 1')) {
          Get.offAllNamed(Other1Page.routeName);
        } else if (title.contains('Other 2')) {
          Get.offAllNamed(Other2Page.routeName);
        }
        changeSelectedItem(title);
        // Navigator.of(context).pop(); // closing the drawer
      },
      child: Container(
        constraints: BoxConstraints(
            //maxHeight: 48,
            ),
        //width: 384.w,
        height: 48,
        child: Row(
          children: [
            // Container(
            //   width: 8,
            //   height: double.infinity,
            //   decoration: const BoxDecoration(color: Colors.white),
            // ),
            const SizedBox(
              width: 23,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 25,
                maxHeight: 25,
              ),
              child: const Icon(
                //size: 36,
                Icons.person_outline_rounded,
                color: Color(0XFF2E6BDC),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            FittedBox(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14, // 18
                  fontWeight: FontWeight.w300,
                  color: Color(0XFF2E6BDC),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _selectedItemTile(String title, BuildContext context) {
    return InkWell(
      onTap: () {
        changeSelectedItem(title);
        // Navigator.of(context).pop(); // closing the drawer
      },
      child: Container(
        //width: 384.w,
        height: 48,
        decoration: const BoxDecoration(color: Color(0XFFF2F2F2)),
        child: Row(
          children: [
            Container(
              width: 8,
              height: double.infinity,
              decoration: const BoxDecoration(color: Color(0XFF2E6BDC)),
            ),
            const SizedBox(
              width: 15,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 25, maxWidth: 25),
              child: const Icon(
                Icons.person_outline_rounded,
                color: Color(0XFF2E6BDC),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            FittedBox(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14, //18
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF2E6BDC),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }

  InkWell getListTile(String listItem, BuildContext context) {
    if (selectedDrawerItem == listItem) {
      return _selectedItemTile(listItem, context);
    } else {
      return _normalItemTile(listItem, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 384.w, // 384
      child: Column(
        children: [
          SizedBox(
            height: 43.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: drawerItemList.length,
              itemBuilder: (ctx, index) =>
                  getListTile(drawerItemList[index], context),
            ),
          ),
        ],
      ),
    );
  }
}
