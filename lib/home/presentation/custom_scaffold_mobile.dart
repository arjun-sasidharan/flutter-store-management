import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/appbar/app_bar_mobile.dart';
import '../../common/widgets/drawer/drawer_mobile.dart';
import '../application/home_controller.dart';

class CustomScaffoldMobile extends StatelessWidget {
  final Widget child;
  bool? resizeToAvoidBottomInset;

  CustomScaffoldMobile({
    Key? key,
    required this.child,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
    return GetBuilder<HomeController>(
        init: Get.put(HomeController(), permanent: true),
        builder: (homeControllerState) {
          return Scaffold(
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            //appBar: AppBarMobile(MediaQuery.of(context).padding.top),
            appBar: AppBarMobile(
              topPadding: statusBarHeight,
              scaffoldKey: _scaffoldKey,
            ),
            body: Scaffold(
              key: _scaffoldKey,
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
              drawer: DrawerMobile(
                drawerItemList: homeControllerState.drawerItemList,
                selectedDrawerItem: homeControllerState.selectedItem,
                changeSelectedItem: homeControllerState.changeSelectedItem,
              ),
              body: child,
            ),
          );
        });
  }
}
