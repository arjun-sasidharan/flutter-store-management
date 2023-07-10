import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../_redundant_old_design/store_home_page_web_old.dart';
import 'store_home_page_mobile.dart';
import 'store_home_page_web.dart';

class StoreHomepage extends StatelessWidget {
  const StoreHomepage({Key? key}) : super(key: key);

  static const routeName = '/store_management';

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context) => StoreHomePageMobile(),
        // desktop: (BuildContext context) =>  StoreHomePageWebOld(),
        desktop: (BuildContext context) => StoreHomePageWeb());
  }
}
