import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:store_management_flutter/home/application/home_controller.dart';
import 'package:store_management_flutter/store_management/modules/store_home/presentation/store_home/store_home_page.dart';


import './home_page_mobile.dart';
import './home_page_web.dart';
import '../../store_management/modules/store_home/presentation/store_home/store_home_page_web.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
            // mobile: (BuildContext context) => HomePageMobile(),
            mobile: (BuildContext context) => const StoreHomepage(),
            //desktop: (BuildContext context) =>  HomePageWebOld(),
            // desktop: (BuildContext context) => StoreHomePageWebNew(),
            desktop: (BuildContext context) => const StoreHomepage(),
          );
  }
}
