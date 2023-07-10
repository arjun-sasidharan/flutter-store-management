import 'package:flutter/material.dart';
import 'package:store_management_flutter/home/presentation/custom_scaffold_mobile.dart';

class Other2PageMobile extends StatelessWidget {
  const Other2PageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldMobile(
      child: const Scaffold(
        backgroundColor: Color(0XFFF7F7F7),
        body: Center(
          child: Text('Other 2 mobile'),
        ),
      ),
    );
  }
}
