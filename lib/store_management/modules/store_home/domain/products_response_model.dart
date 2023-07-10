import './product_data_model.dart';

class ProductsResponseModel {
  bool? success;
  List<Product>? productsList;
  String? message; //  this is null, when success is true and data is not null

  ProductsResponseModel({this.success, this.productsList, this.message});

  ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      productsList = <Product>[];
      json['data'].forEach((v) {
        productsList!.add(new Product.fromJson(v));
      });
    }
    if (json['message'] != null) {
      message = json['message'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.productsList != null) {
      data['data'] = this.productsList!.map((v) => v.toJson()).toList();
    }
    // this message can be null
    if (message != null) {
      data['message'] = message;
    }
    return data;
  }
}
