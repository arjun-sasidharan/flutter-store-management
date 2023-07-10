import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:store_management_flutter/common/widgets/appbar/app_bar_web.dart';
import 'package:store_management_flutter/home/application/home_controller.dart';

import '../../common/widgets/appbar/app_bar_mobile.dart';
import '../../common/widgets/drawer/drawer_mobile.dart';
import '../../store_management/modules/store_home/presentation/store_home/store_home_page.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeControllerState) {
          return Scaffold(
            //appBar: AppBarMobile(MediaQuery.of(context).padding.top),
            appBar: AppBarMobile(
              topPadding: statusBarHeight,
              scaffoldKey: _scaffoldKey,
            ),
            body: Scaffold(
              key: _scaffoldKey,
              drawer: DrawerMobile(
                  drawerItemList: homeControllerState.drawerItemList,
                  selectedDrawerItem: homeControllerState.selectedItem,
                  changeSelectedItem: homeControllerState.changeSelectedItem,
              ),
             // body:
          //     Builder(
          //       builder: (ctx) {
          // if (homeControllerState.selectedItem ==
          // 'Store Management System') {
              //       return StoreHomepage();
              //     } else if (homeControllerState.selectedItem == 'Other 1') {
              //       return Center(
              //         child: Column(
              //           children: const [
              //             Text('Other 1'),
              //             Text('Mobile Screen'),
              //           ],
              //         ),
              //       );
              //     } else if (homeControllerState.selectedItem == 'Other 2') {
              //       return Center(
              //         child: Column(
              //           children: const [
              //             Text('Other 2'),
              //             Text('Mobile Screen'),
              //           ],
              //         ),
              //       );
              //     } else {
              //       return const Center(
              //         child: Text('Mobile Screen'),
              //       );
              //     }
              //   },
              // ),
            ),
          );
        }
    );
  }
}
