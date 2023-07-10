import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_management_flutter/store_management/modules/store_home/application/add_store_controller.dart';

import '../../domain/product_data_model.dart';

class ProductsTableWithActionWeb extends StatelessWidget {
  const ProductsTableWithActionWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddStoreController>(builder: (addStoreControllerState) {
      return Column(
        children: [
          // table
          Table(
            columnWidths: const {
              0: FixedColumnWidth(60), // width of first column
              1: FlexColumnWidth(1.3),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(2),
              5: FlexColumnWidth(1),
              6: FixedColumnWidth(80),
            },
            border: TableBorder.all(color: Colors.grey),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            // how item are vertically aligned in a row
            children: buildTableRows(addStoreControllerState.newProductsList),
          ),
          if (addStoreControllerState.newProductsList.isEmpty)
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
              },
              border: const TableBorder(
                bottom: BorderSide(color: Colors.grey),
                right: BorderSide(color: Colors.grey),
                left: BorderSide(color: Colors.grey),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 44),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'No Data Added',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ])
              ],
            )
        ],
      );
    });
  }

  List<TableRow> buildTableRows(List<Product>? productList) {
    List<TableRow> tableRow = [];
    // adding heading
    tableRow.add(tableHeadingRow());
    int productListItems = productList!.length;
    for (int i = 0; i < productListItems; i++) {
      tableRow.add(buildTableRowWithContent(productList[i], i));
    }
    return tableRow;
  }

  // table row builder
  TableRow buildTableRowWithContent(Product product, int itemNo) {
    double rowHeight = 44;
    double vPadding = 4;
    double hPadding = 4;
    double fontSize = 14;
    return TableRow(children: [
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: rowHeight),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${itemNo + 1}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: rowHeight),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${product.productId}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: rowHeight),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${product.productName}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: rowHeight),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${product.quantity}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: rowHeight),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${product.vendorDetails}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: rowHeight),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${product.price}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: rowHeight),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: IconButton(
                splashRadius: 20,
                onPressed: () {
                  // delete product from the product list
                  Get.find<AddStoreController>().removeFromTheProductList(product);
                },
                icon: const Icon(
                  Icons.delete_outline_outlined,
                  color: Color(0XFF2E6BDC),
                )),
          ),
        ),
      ),
    ]);
  }

  TableRow tableHeadingRow() {
    double rowHeight = 44;
    double vPadding = 4;
    double hPadding = 4;
    double fontSize = 14;
    return TableRow(children: [
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: rowHeight),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Sr. No',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: rowHeight),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Product ID',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: rowHeight),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Product Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: rowHeight),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Quantity',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: rowHeight),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Vendor Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: rowHeight),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Price',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(minHeight: rowHeight),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Action',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
