import 'package:flutter/material.dart';
import 'package:store_management_flutter/home/presentation/custom_scaffold_mobile.dart';

class Other1PageMobile extends StatelessWidget {
  const Other1PageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldMobile(
      child: const Scaffold(
        backgroundColor: Color(0XFFF7F7F7),
        body: Center(
          child: Text('Other 1 mobile'),
        ),
      ),
    );
  }
}
