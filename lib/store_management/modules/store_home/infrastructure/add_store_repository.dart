import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../domain/product_data_model.dart';
import '../../../store_common/api_endpoints.dart';
import '../../../store_common/strings.dart';
import '../domain/store_data_model.dart';
import '../domain/add_store_request_data_model.dart';
import '../domain/add_store_response_data_model.dart';

class AddStoreRepository {
  final Dio dioInstance = Dio();

  // <message, success>
  Future<Either<String, bool>> insertStoreData(
      Store store, List<Product> productsList) async {
    debugPrint('In insertStoreData method (repository)');
    try {
      // check if running on web or not
      String apiUrl;
      if (kIsWeb) {
        // running on web
        apiUrl = ApiEndpoints.insertStoreDataUrlForWeb;
      } else {
        apiUrl = ApiEndpoints.insertStoreDataUrlForMobile;
      }
      // creating the request body using the store and list of products
      AddStoreRequestDataModel requestDataModel = AddStoreRequestDataModel(
        storeId: store.storeId,
        storeName: store.storeName,
        domainId: store.domainId,
        establishYear: store.establishYear,
        location: store.location,
        productsList: productsList,
      );
      // inserting data
      Response responseData = await dioInstance.post(apiUrl,
          data: requestDataModel.toJson(),
          options: Options(receiveDataWhenStatusError: true));
      debugPrint(
          'store insert request response status code: ${responseData.statusCode}');
      AddStoreResponseDataModel addStoreResponseDataModel =
          AddStoreResponseDataModel.fromJson(responseData.data);

      if (responseData.statusCode == 200) {
        if (addStoreResponseDataModel.success ?? false) {
          // success is true
          return right(addStoreResponseDataModel.success!); //true
        } else {
          // not success
          debugPrint(addStoreResponseDataModel.message);
          return left(
              addStoreResponseDataModel.message ?? errorSomethingWentWrong);
        }
        // either success is false or null, both case, no data, show error message
      } else {
        debugPrint(addStoreResponseDataModel.message);
        return left(
            addStoreResponseDataModel.message ?? errorSomethingWentWrong);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        // response data is not null
        print(e.response!.data);
        debugPrint(
            'In, Dio Error catch block, store insert request response status code: ${e.response!.statusCode}');
        AddStoreResponseDataModel addStoreResponseDataModel =
            AddStoreResponseDataModel.fromJson(e.response!.data);
        // not success
        debugPrint(addStoreResponseDataModel.message);
        return left(
            addStoreResponseDataModel.message ?? errorSomethingWentWrong);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        debugPrint(e.message);
        return left(errorSomethingWentWrong);
      }
    } catch (error) {
      debugPrint('in the catch block');
      debugPrint(error.toString());
      return left(errorSomethingWentWrong);
    }
  }
}
