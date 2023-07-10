import './product_data_model.dart';

class AddStoreRequestDataModel {
  int? storeId;
  String? storeName;
  String? domainId;
  int? establishYear;
  String? location;
  List<Product>? productsList;

  AddStoreRequestDataModel(
      {this.storeId,
      this.storeName,
      this.domainId,
      this.establishYear,
      this.location,
      this.productsList});

  AddStoreRequestDataModel.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    storeName = json['store_name'];
    domainId = json['domain_id'];
    establishYear = json['establish_year'];
    location = json['location'];
    if (json['childinfo'] != null) {
      productsList = <Product>[];
      json['childinfo'].forEach((v) {
        productsList!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['store_name'] = this.storeName;
    data['domain_id'] = this.domainId;
    data['establish_year'] = this.establishYear;
    data['location'] = this.location;
    if (this.productsList != null) {
      data['childinfo'] = this.productsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
