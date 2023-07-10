import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import './other2_page_mobile.dart';
import './other2_page_web.dart';

class Other2Page extends StatelessWidget {
  const Other2Page({Key? key}) : super(key: key);

  static const routeName = '/other_2';

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const Other2PageMobile(),
      desktop: (BuildContext context) => const Other2PageWeb(),
    );
  }
}
