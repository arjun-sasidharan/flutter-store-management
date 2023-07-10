import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:store_management_flutter/store_management/modules/store_home/application/products_controller.dart';

import '../domain/product_data_model.dart';
import '../domain/store_data_model.dart';
import '../infrastructure/add_store_repository.dart';
import '../../../store_common/strings.dart';

// TODO: testing, delete later
Future sleep1([int sec = 1]) {
  return Future.delayed(Duration(seconds: sec), () => "1");
}

class AddStoreController extends GetxController {
  AddStoreRepository addStoreRepository = AddStoreRepository();
  var isLoading = false;
  var isError = false;
  var isSaveProcessing = false;
  var isSaveOperationSuccess = false;
  var errorMessage = '';
  var currentStatus = 'No status';
  int? storeId;

  var isDeleteOperationProcessing = false;

  Store? storeDate;
  List<Product> newProductsList = [];

  // store form related
  final storeFormKey =
      GlobalKey<FormState>(); // not using on mobile, widget global key is using
  final storeIdController = TextEditingController();
  final storeNameController = TextEditingController();
  final storeDomainIdController = TextEditingController();
  final storeYearController = TextEditingController();
  final storeLocationController = TextEditingController();

  // product form related
  final productFormKey =
      GlobalKey<FormState>(); // not using on mobile, widget global key is using
  final productIdController = TextEditingController();
  final productNameController = TextEditingController();
  final productQuantityController = TextEditingController();
  final productVendorDetailsController = TextEditingController();
  final productPriceController = TextEditingController();

  @override
  void onClose() {
    storeIdController.dispose();
    storeNameController.dispose();
    storeDomainIdController.dispose();
    storeYearController.dispose();
    storeLocationController.dispose();

    productIdController.dispose();
    productNameController.dispose();
    productQuantityController.dispose();
    productVendorDetailsController.dispose();
    productPriceController.dispose();
  }

  bool isStoreDataAdded() {
    // debugPrint('store id: ${storeIdController.value.text}');
    // debugPrint('store name: ${storeNameController.value.text}');
    // debugPrint('store domain id: ${storeDomainIdController.value.text}');
    // debugPrint('store year: ${storeYearController.value.text}');
    // debugPrint('store location: ${storeLocationController.value.text}');
    if (storeIdController.value.text.isEmpty &&
        storeNameController.value.text.isEmpty &&
        storeDomainIdController.value.text.isEmpty &&
        storeYearController.value.text.isEmpty &&
        storeLocationController.value.text.isEmpty) {
      return false; // all field empty
    }
    return true; // data added
  }

  // this method is called only from the mobile device
  // this will be an async func, for storing the data to the backend
  Future<bool> saveStoreData() async {
    debugPrint('in save store data');
    // TODO: check if store is not empty, and product list is not empty
    // validation are done in the widget itself
    isSaveProcessing = true;
    isSaveOperationSuccess = false; // initially setting it to false
    update();

    debugPrint('store id: ${storeIdController.value.text}');
    debugPrint('store name: ${storeNameController.value.text}');
    debugPrint('store domain id: ${storeDomainIdController.value.text}');
    debugPrint('store year: ${storeYearController.value.text}');
    debugPrint('store location: ${storeLocationController.value.text}');
    try {
      // creating store object
      Store newStore = Store(
        storeId: int.parse(storeIdController.value.text),
        storeName: storeNameController.value.text,
        domainId: storeDomainIdController.value.text,
        establishYear: int.parse(storeYearController.value.text),
        location: storeLocationController.value.text,
      );
      // product list will be available at new product list

      // // inserting store data
      Either<String, bool> insertStoreResponse =
          await addStoreRepository.insertStoreData(newStore, newProductsList);

      insertStoreResponse.fold((l) {
        // error
        if (l.contains(
            "Might be a request for duplicate entry for master table or syntax error!")) {
          // duplicate store data
          errorMessage = errorDuplicateStoreEntry;
        } else if (l.contains(
            "Might be a duplicate entry for child table or syntax error! but data has been stored in master table")) {
          errorMessage = errorDuplicateProductEntry;
        } else {
          errorMessage = errorSomethingWentWrong;
        }
        isError = true;
        currentStatus = l;
        isSaveOperationSuccess = false;
      }, (r) {
        // success
        isSaveOperationSuccess = true;
        currentStatus = 'Store data inserted';
        errorMessage = '';
        isError = false;
      });

      debugPrint('store insert, current status: $currentStatus');
      // after operation
      isSaveProcessing = false;
      update();

      // debugPrint('sleep is started');
      // await sleep1(3);
      // debugPrint('sleep is ended');

    } catch (err) {
      debugPrint('caught error $err');
    }

    return isSaveOperationSuccess;
  }

  // Store Data Validator

  String? storeIdValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Fill this field';
      }
      if (!value.isNum) {
        return 'Invalid Store ID';
      }
      if (value.length != 5) {
        return 'Invalid Store ID (must be a 5 digit number)';
      }
    }
    return null;
  }

  String? storeNameValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Fill this field';
      }
      if (value.length < 4) {
        return 'Text is too short';
      }
    }
    return null;
  }

  String? storeDomainIdValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Fill this field';
      }
      if (!value.isURL) {
        return 'Invalid Domain ID';
      }
    }
    return null;
  }

  String? locationValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Fill this field';
      }
      if (value.length < 5) {
        return 'Text is too short';
      }
    }
    return null;
  }

  String? yearValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Fill this field';
      }
      if (!value.isNum) {
        return 'Invalid year';
      }
      if (value.length != 4) {
        return 'Invalid year';
      }
      int currentYear = DateTime.now().year;
      debugPrint('current year $currentYear');
      if (int.parse(value) > currentYear) {
        return 'Invalid year (can not be greater than current year)';
      }
    }
    return null;
  }

  String? validator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Fill this field';
      }
    }
    return null;
  }

  String? stringValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Fill this field';
      }
      if (value.length < 4) {
        return 'Text is too short';
      }
    }
    return null;
  }

  String? numberValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Fill this field';
      }
      if (!value.isNum) {
        return 'Invalid number';
      }
      if (value.length < 4) {
        return 'Text is too short';
      }
    }
    return null;
  }

  // Product Form Validator
  String? productIdValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Fill this field';
      }
      if (!value.isNum) {
        return 'Invalid Product ID';
      }
      if (value.length != 5) {
        return 'Invalid Product ID (must be a 5 digit number)';
      }
    }
    return null;
  }

  String? productNameValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Fill this field';
      }
      if (value.length < 4) {
        return 'Text is too short';
      }
    }
    return null;
  }

  String? productQuantityValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Fill this field';
      }
    }
    return null;
  }

  String? productVendorDetailsValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Fill this field';
      }
      if (!value.isEmail) {
        return 'Invalid Email id';
      }
    }
    return null;
  }

  String? productPriceValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Fill this field';
      }
      if (!value.isNum) {
        return 'Invalid Price';
      }
    }
    return null;
  }

  clearProductForm() {
    productIdController.clear();
    productNameController.clear();
    productQuantityController.clear();
    productVendorDetailsController.clear();
    productPriceController.clear();
  }

  // clearing store form and product list
  clearAll() {
    clearStoreForm();
    clearProductList();
    update();
  }

  clearStoreForm() {
    storeIdController.clear();
    storeNameController.clear();
    storeDomainIdController.clear();
    storeYearController.clear();
    storeLocationController.clear();
  }

  clearProductList() {
    newProductsList = [];
  }

  // adding product to the product list (local only)
  addProductToTheProductList() {
    debugPrint('product id: ${productIdController.value.text}');
    debugPrint('product name: ${productNameController.value.text}');
    debugPrint('product quantity: ${productQuantityController.value.text}');
    debugPrint('product vendor: ${productVendorDetailsController.value.text}');
    debugPrint('product price: ${productPriceController.value.text}');

    // reading text field input
    int productId = int.parse(productIdController.value.text);
    String productName = productNameController.value.text;
    String quantity = productQuantityController.value.text;
    String vendorDetails = productVendorDetailsController.value.text;
    int price = int.parse(productPriceController.value.text);

    newProductsList.add(Product(
      productId: productId,
      productName: productName,
      quantity: quantity,
      vendorDetails: vendorDetails,
      price: price,
    ));
    update();
  }

  removeFromTheProductList(Product deletingProduct) {
    debugPrint('removing ${deletingProduct.productName} from the list');
    newProductsList.removeWhere(
        (product) => product.productId == deletingProduct.productId);
    update();
  }

  // these below method are not using anymore

// add product for existing store, and also update product list on product controller
  saveProduct(Store store) {
    // reading text field input
    int productId = int.parse(productIdController.value.text);
    String productName = productNameController.value.text;
    String quantity = productQuantityController.value.text;
    String vendorDetails = productVendorDetailsController.value.text;
    int price = int.parse(productPriceController.value.text);
    debugPrint('adding $productName to store: ${store.storeName}');

    Product newProduct = Product(
      productId: productId,
      productName: productName,
      quantity: quantity,
      vendorDetails: vendorDetails,
      price: price,
    );
    // adding product to the backend

    // if operation success, adding it to the products state

    Get.find<ProductsController>().addProductToList(newProduct);
    // after adding to list, clearing the form
    clearProductForm();
    update();
  }

// call this func only on web version, for only web version the product controller will be initialized at the time of calling this func

// delete product for web
  deleteProduct(Store store, Product product) {
    isDeleteOperationProcessing = true;
    update();
    debugPrint('deleting ${product.productName} from ${store.storeName}');

    // db operation

    // isDeleteOperationProcessing = false;
    // if success, update the list on products state
    Get.find<ProductsController>().deleteProductFromList(product);
    update();
  }
}
