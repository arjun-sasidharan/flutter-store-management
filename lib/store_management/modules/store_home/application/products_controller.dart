import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../store_common/strings.dart';
import '../domain/product_data_model.dart';
import '../infrastructure/products_repository.dart';

class ProductsController extends GetxController {
  ProductsRepository productsRepository = ProductsRepository();
  var isLoading = false;
  var isError = false;
  var errorMessage = '';
  var currentStatus = 'No status';
  int? storeId;

  ProductsController({
    this.storeId,
  });

  List<Product>? productsList;

  @override
  void onInit() {
    // initializing the product list
    productsList = [];
    if (storeId != null) {
      // calling only if store id not null
      fetchProductsData(storeId!);
    }
  }

  // called by web
  clearProductsList() {
    productsList = [];
    // TODO: implement
    // reset the store id also
    storeId = null;
    update();
  }

  // method for fetching products list of a store
  // post method, with store id as input
  fetchProductsData(int storeId) async {
    debugPrint('In fetchProductsData, store id: $storeId');
    isLoading = true;
    update();


  // temp product

    // productsList = [
    //   Product(
    //     productId: 12345,
    //     productName: "Britania Good Day",
    //     quantity: "20gms",
    //     vendorDetails: "goodday@gmail.com",
    //     price: 20,
    //   ),
    //   Product(
    //     productId: 14589,
    //     productName: "Parle Cookie",
    //     quantity: "50gms",
    //     vendorDetails: "parle@gmail.com",
    //     price: 100,
    //   ),
    // ];


    // fetching from api
    Either<String, List<Product>> productsResponse =
    await productsRepository.fetchProductsData(storeId);

    productsResponse.fold((l) {
      if (l.contains(
          "Selected Store Id is not present in database")) {
        // duplicate store data
        errorMessage = errorProductsFetch;
      } else {
        errorMessage = errorSomethingWentWrong;
      }
      isError = true;
      currentStatus = l;
    }, (r) {
      productsList = r;
      currentStatus = 'Products data fetched';
      errorMessage = '';
      isError = false;
    });

    debugPrint('product fetching, current status: $currentStatus');


    isLoading = false;
    update();
  }

// add product for web
  addProductToList(Product product) {
    productsList!.add(product);
    update();
  }

// delete product for web
  deleteProductFromList(Product deletingProduct) {
    productsList!.removeWhere(
        (product) => product.productId == deletingProduct.productId);
    update();
  }

// before adding and deleting make sure the store id are same (store id in the product controller and the add store controller)
}
