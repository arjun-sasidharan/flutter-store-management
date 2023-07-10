import 'package:flutter/material.dart';

import '../home/presentation/custom_scaffold_web.dart';

class Other2PageWeb extends StatelessWidget {
  const Other2PageWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScaffoldWeb(
      child: Scaffold(
        backgroundColor: Color(0XFFF7F7F7),
        body: Center(
          child: Text('Other 2 web'),
        ),
      ),
    );
  }
}
