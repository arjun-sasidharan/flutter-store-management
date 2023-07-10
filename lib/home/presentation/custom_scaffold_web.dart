import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/drawer/drawer_web.dart';
import '../../common/widgets/appbar/app_bar_web.dart';
import '../application/home_controller.dart';

class CustomScaffoldWeb extends StatelessWidget {
  final Widget child;

  const CustomScaffoldWeb({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
    // _scaffoldKey.currentState?.openDrawer();
    return GetBuilder<HomeController>(
        init: Get.put(HomeController(), permanent: true),
        builder: (homeControllerState) {
          // updating the selected item in drawer based on current route

          return Scaffold(
            appBar: AppBarWeb(
              topPadding: statusBarHeight,
              scaffoldKey: _scaffoldKey,
              drawerIconOnClick: homeControllerState.openOrCloseSideNav,
            ),
            body: Scaffold(
              key: _scaffoldKey,
              // drawer: DrawerWeb(
              //   drawerItemList: homeControllerState.drawerItemList,
              //   selectedDrawerItem: homeControllerState.selectedItem,
              //   changeSelectedItem: homeControllerState.changeSelectedItem,
              // ),
              body: Row(
                children: [
                  if (homeControllerState.isSideNavOpen)
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 260,
                        maxWidth: 280,
                      ),
                      child: DrawerWeb(
                        drawerItemList: homeControllerState.drawerItemList,
                        selectedDrawerItem: homeControllerState.selectedItem,
                        changeSelectedItem:
                            homeControllerState.changeSelectedItem,
                      ),
                    ),
                  Expanded(
                    child: child,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
