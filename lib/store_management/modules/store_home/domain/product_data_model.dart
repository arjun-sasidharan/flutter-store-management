class Product {
  int? productId;
  String? productName;
  String? quantity;
  String? vendorDetails;
  int? price;

  Product(
      {this.productId,
        this.productName,
        this.quantity,
        this.vendorDetails,
        this.price});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    quantity = json['quantity'];
    vendorDetails = json['vendor_details'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['quantity'] = this.quantity;
    data['vendor_details'] = this.vendorDetails;
    data['price'] = this.price;
    return data;
  }
}
