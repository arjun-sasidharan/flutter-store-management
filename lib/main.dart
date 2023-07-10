import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import './home/presentation/home_page.dart';
import './store_management/modules/store_home/presentation/store_home/store_home_page.dart';
import './other_1/other1_page.dart';
import './other_2/other2_page.dart';

void main() {
  //await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(1920, 1080),
      builder: (ctx, child) {
        return GetMaterialApp(
          title: 'Store Management',
          debugShowCheckedModeBanner: false,
          // to hide the debug banner
          theme: ThemeData(primarySwatch: Colors.grey, fontFamily: 'JioType'),
          getPages: [
            GetPage(name: '/home', page: () => const HomePage()),
            GetPage(
              name: StoreHomepage.routeName,
              page: () => const StoreHomepage(),
            ),
            GetPage(
              name: Other1Page.routeName,
              page: () => const Other1Page(),
            ),
            GetPage(
              name: Other2Page.routeName,
              page: () => const Other2Page(),
            ),
          ],
          initialRoute: StoreHomepage.routeName,
          unknownRoute: GetPage(
              name: StoreHomepage.routeName, page: () => const StoreHomepage()),
        );
      },
    );
  }
}
