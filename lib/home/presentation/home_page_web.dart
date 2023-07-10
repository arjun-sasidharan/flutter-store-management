import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:store_management_flutter/common/widgets/appbar/app_bar_web.dart';
import 'package:store_management_flutter/home/application/home_controller.dart';
import '../../common/widgets/drawer/drawer_web.dart';
import '../../store_management/modules/store_home/presentation/store_home/store_home_page.dart';

class HomePageWeb extends StatelessWidget {
  const HomePageWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
    // _scaffoldKey.currentState?.openDrawer();
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeControllerState) {
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
                    child: Builder(
                      builder: (ctx) {
                        if (homeControllerState.selectedItem ==
                            'Store Management System') {
                          return StoreHomepage();
                        } else if (homeControllerState.selectedItem ==
                            'Other 1') {
                          return Center(
                            child: Column(
                              children: const [
                                Text('Other 1'),
                                Text('Desktop'),
                              ],
                            ),
                          );
                        } else if (homeControllerState.selectedItem ==
                            'Other 2') {
                          return Center(
                            child: Column(
                              children: const [
                                Text('Other 2'),
                                Text('Desktop'),
                              ],
                            ),
                          );
                        } else {
                          return const Center(
                            child: Text('Desktop'),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
