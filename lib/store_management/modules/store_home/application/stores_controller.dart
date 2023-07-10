import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../domain/store_data_model.dart';
import '../infrastructure/stores_repository.dart';

class StoresController extends GetxController {
  StoresRepository storesRepository = StoresRepository();
  var isLoading = false;
  var isError = false;
  var errorMessage = '';
  var currentStatus = 'No status';

  //StoresData? storesData;
  List<Store> storesList = [];

  // web only
  Store? selectedStore; // used only in web
  Object? selectedValue;
  final storeDomainIdController = TextEditingController();
  final storeYearController = TextEditingController();
  final storeLocationController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchStoresData();
  }

  @override
  void onClose() {
    storeDomainIdController.dispose();
    storeYearController.dispose();
    storeLocationController.dispose();
  }

  clearStoreForm() {
    storeDomainIdController.clear();
    storeYearController.clear();
    storeLocationController.clear();
    // resetting the drop down
    selectedValue = null;
    // reset the selectedStore
    selectedStore = null;
    update();
  }

  fetchStoresData() async {
    debugPrint('In fetchStoresData');
    isLoading = true;
    update();
    // initializing stores list with empty list
    storesList = [];
    /*
    //temp store data
    storesList = [
      Store(
        storeName: 'S-Mart',
        storeId: 12045,
        domainId: 'smart.in',
        establishYear: 2019,
        location: 'Haryana',
      ),
      Store(
        storeName: 'Trends',
        storeId: 12067,
        domainId: 'trends.com',
        establishYear: 1997,
        location: 'Gujrat',
      ),
    ];
    */

    // fetching from api
    Either<String, List<Store>> storeResponse =
        await storesRepository.fetchStoreData();

    storeResponse.fold((l) {
      errorMessage = l;
      isError = true;
      currentStatus = l;
    }, (r) {
      storesList = r;
      currentStatus = 'Store data fetched';
      isError = false;
    });

    debugPrint('store fetching, current status: $currentStatus');

    isLoading = false;
    update();
  }

// REDUNDANT CODE - OLD DESIGN

  // drop down field on change - used only in web
  selectStore(Object? value) {
    debugPrint('drop down selected item: $value');
    selectedValue = value;
    // NOTE
    // here selectedValue is not store name, it is store id, but in the drop down menu the store name will be displayed
    // even if we pass this selectedValue object
    selectedStore = storesList.firstWhere(
        (store) => store.storeId.toString().contains(value.toString()));
    debugPrint('selected store name: ${selectedStore!.storeName}');
    debugPrint('selected value: $selectedValue');
    storeDomainIdController.text = selectedStore!.domainId ?? '';
    storeYearController.text = selectedStore!.establishYear.toString() ?? '';
    storeLocationController.text = selectedStore!.location ?? '';
    update();
  }
}
