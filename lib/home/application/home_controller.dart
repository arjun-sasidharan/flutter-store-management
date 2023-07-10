import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isSideNavOpen = true; // only apply for web screen

  List<String> drawerItemList = [
    'Store Management System',
    'Other 1',
    'Other 2',
  ];
  var selectedItem = 'Store Management System';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // selectedItem = drawerItemList[0];
  }

  void changeSelectedItem(String newSelectedItem) {
    selectedItem = newSelectedItem;
    update();
  }

  void openOrCloseSideNav([bool? open]) {
    if (open == null) {
      // toggle
      isSideNavOpen = !isSideNavOpen;
    } else {
      isSideNavOpen = open; // manual update
    }
    update();
  }
}
