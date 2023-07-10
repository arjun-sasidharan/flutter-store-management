import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import './other1_page_mobile.dart';
import './other1_page_web.dart';

class Other1Page extends StatelessWidget {
  const Other1Page({Key? key}) : super(key: key);

  static const routeName = '/other_1';

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const Other1PageMobile(),
      desktop: (BuildContext context) => const Other1PageWeb(),
    );
  }
}
