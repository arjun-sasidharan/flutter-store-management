import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/product_data_model.dart';

class ProductListItemMobile extends StatelessWidget {
  Product product;
  int itemNo;

  ProductListItemMobile(this.product, this.itemNo);

  // for giving space between rows
  static const rowSpacer = TableRow(children: [
    SizedBox(
      height: 8,
    ),
    SizedBox(
      height: 8,
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(1), // width of first column
          1: FlexColumnWidth(1),
        },
        // border: TableBorder.all(color: Colors.grey),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        // how item are vertically aligned in a row

        children: [
          TableRow(
            children: [
              const Text(
                'Sr. No',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$itemNo',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              const Text(
                'Product ID',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${product.productId}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              const Text(
                'Product Name',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${product.productName}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              const Text(
                'Quantity',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${product.quantity}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              const Text(
                'Vendor Details',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${product.vendorDetails}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '\u{20B9}${product.price}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
