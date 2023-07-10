// created this class bcs, to separate the store data from the response
// which is an object that contain list of stores and other data

class Store {
  int? storeId;
  String? storeName;
  String? domainId;
  int? establishYear;
  String? location;

  Store(
      {this.storeId,
      this.storeName,
      this.domainId,
      this.establishYear,
      this.location});

  Store.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    storeName = json['store_name'];
    domainId = json['domain_id'];
    establishYear = json['establish_year'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = storeId;
    data['store_name'] = storeName;
    data['domain_id'] = domainId;
    data['establish_year'] = establishYear;
    data['location'] = location;
    return data;
  }
}
