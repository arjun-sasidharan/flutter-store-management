import './store_data_model.dart';

class StoresResponseModel {
  bool? success;
  List<Store>? storesList;
  String? message; //  this is null, when success is true and data is not null

  StoresResponseModel({this.success, this.storesList, this.message});

  StoresResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      storesList = <Store>[];
      json['data'].forEach((v) {
        storesList!.add(new Store.fromJson(v));
      });
    }
    if (json['message'] != null) {
      message = json['message'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    if (this.storesList != null) {
      data['data'] = this.storesList!.map((v) => v.toJson()).toList();
    }
    // this message can be null
    if (message != null) {
      data['message'] = message;
    }
    return data;
  }
}
