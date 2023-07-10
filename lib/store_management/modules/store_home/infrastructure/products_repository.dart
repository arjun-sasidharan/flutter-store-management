import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_management_flutter/store_management/modules/store_home/domain/products_response_model.dart';

import '../domain/product_data_model.dart';
import '../../../store_common/api_endpoints.dart';
import '../../../store_common/strings.dart';

class ProductsRepository {
  final Dio dioInstance = Dio();

  Future<Either<String, List<Product>>> fetchProductsData(int storeId) async {
    debugPrint('In fetchProductsData method (repository)');
    // fetching data
    try {
      // check if running on web or not
      String apiUrl;
      if (kIsWeb) {
        // running on web
        apiUrl = ApiEndpoints.productsListDataUrlForWeb;
      } else {
        apiUrl = ApiEndpoints.productsListDataUrlForMobile;
      }
      Response responseData = await dioInstance.post(apiUrl,
        data: {
          "selectedStoreId": storeId,
        },
      );
      debugPrint('product data res status code: ${responseData.statusCode}');
      ProductsResponseModel productsResponseModel =
          ProductsResponseModel.fromJson(responseData.data);

      if (responseData.statusCode == 200) {
        if (productsResponseModel.success ?? false) {
          // success is true
          // check if products list is null
          if (productsResponseModel.productsList != null) {
            List<Product> productList = productsResponseModel.productsList!;
            return right(productList);
          } else {
            // success is true, but list is null
            debugPrint(productsResponseModel.message);
            return left(
                productsResponseModel.message ?? errorSomethingWentWrong);
          }
        } else {
          debugPrint(productsResponseModel.message);
          return left(productsResponseModel.message ?? errorSomethingWentWrong);
        }
        // either success is false or null, both case, no data, show error message
      } else {
        debugPrint(productsResponseModel.message);
        return left(productsResponseModel.message ?? errorSomethingWentWrong);
      }
    } catch (error) {
      debugPrint('in the catch block');
      debugPrint(error.toString());
      return left(errorSomethingWentWrong);
    }
  }
}
