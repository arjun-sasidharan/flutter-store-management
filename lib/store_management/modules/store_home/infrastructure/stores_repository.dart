import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


import 'package:store_management_flutter/store_management/modules/store_home/domain/stores_response_model.dart';

import '../domain/store_data_model.dart';
import '../../../store_common/api_endpoints.dart';
import '../../../store_common/strings.dart';

class StoresRepository {
  final Dio dioInstance = Dio();

  Future<Either<String, List<Store>>> fetchStoreData() async {
    debugPrint('In fetchStoreData method (repository)');
    // fetching data
    try {
      // // dioInstance.options.responseType = ResponseType.json;
      //  dioInstance.options.headers["Accept"] = "*/*";
      //  dioInstance.options.headers["Accept-Encoding"] = "gzip, deflate, br";
      //  dioInstance.options.headers["Content-Type"] = "application/json; charset=utf-8";

      // check if running on web or not
      String apiUrl;
      if (kIsWeb) {
        // running on web
        apiUrl = ApiEndpoints.storesListDataUrlForWeb;
      } else {
        apiUrl = ApiEndpoints.storesListDataUrlForMobile;
      }

      Response responseData =
          await dioInstance.get(apiUrl);
      debugPrint('stores data res status code: ${responseData.statusCode}');
      // debugPrint('STORE RESPONSE\n${responseData.data}');
      // debugPrint('STORE RESPONSE header\n${responseData.headers}');
      // debugPrint('STORE RESPONSE extra \n${responseData.extra}');
      StoresResponseModel storesResponseModel =
          StoresResponseModel.fromJson(responseData.data);

      if (responseData.statusCode == 200) {
        if (storesResponseModel.success ?? false) {
          // success is true
          // check if stores list is null
          if (storesResponseModel.storesList != null) {
            List<Store> storesList = storesResponseModel.storesList!;
            return right(storesList);
          } else {
            // success is true, but list is null
            debugPrint(storesResponseModel.message);
            return left(storesResponseModel.message ?? errorSomethingWentWrong);
          }
        } else {
          debugPrint(storesResponseModel.message);
          return left(storesResponseModel.message ?? errorSomethingWentWrong);
        }
        // either success is false or null, both case, no data, show error message
      } else {
        debugPrint(storesResponseModel.message);
        return left(storesResponseModel.message ?? errorSomethingWentWrong);
      }
    } catch (error) {
      debugPrint('in the catch block');
      debugPrint(error.toString());
      return left(errorSomethingWentWrong);
    }
  }
}
