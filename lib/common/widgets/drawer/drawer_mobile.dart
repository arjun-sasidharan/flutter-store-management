import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../store_management/modules/store_home/presentation/store_home/store_home_page.dart';
import '../../../other_1/other1_page.dart';
import '../../../other_2/other2_page.dart';

class DrawerMobile extends StatelessWidget {
  final List<String> drawerItemList;
  String selectedDrawerItem;
  final Function changeSelectedItem;

  DrawerMobile({
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
        Get.back(closeOverlays: true);
        //Navigator.of(context).pop(); // closing the drawer
      },
      child: Container(
        width: double.infinity,
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
            const Icon(
              //size: 36,
              Icons.person_outline_rounded,
              color: Color(0XFF2E6BDC),
            ),
            const SizedBox(
              width: 14,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Color(0XFF2E6BDC),
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
        Navigator.of(context).pop(); // closing the drawer
      },
      child: Container(
        width: double.infinity,
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
            const Icon(
              Icons.person_outline_rounded,
              color: Color(0XFF2E6BDC),
            ),
            const SizedBox(
              width: 14,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0XFF2E6BDC),
              ),
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
      width: 332,
      child: Column(
        children: [
          const SizedBox(
            height: 43,
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
