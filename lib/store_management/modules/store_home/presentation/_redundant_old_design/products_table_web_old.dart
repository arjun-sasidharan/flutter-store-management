import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_management_flutter/store_management/store_common/widgets/loading_spinner.dart';

import '../../../../store_common/widgets/success_dialog.dart';
import '../../../../store_common/widgets/warning_dialog.dart';
import '../../application/add_store_controller.dart';
import '../../application/stores_controller.dart';
import '../../domain/product_data_model.dart';
import '../../application/products_controller.dart';
import '../../domain/store_data_model.dart';

class ProductsTableWebOld extends StatelessWidget {
  const ProductsTableWebOld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemsPerPage = 6;
    return GetBuilder<ProductsController>(builder: (productsControllerState) {
      // items per page will be 10 or length of list, which ever largest
      if (productsControllerState.productsList!.length > 10) {
        itemsPerPage = productsControllerState.productsList!.length;
      }
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
            children: buildTableRows(
                productsControllerState.productsList, itemsPerPage),
          )
        ],
      );
    });
  }

  List<TableRow> buildTableRows(List<Product>? productsList, int noOfRows) {
    List<TableRow> tableRow = [];
    // adding heading
    tableRow.add(tableHeadingRow());
    int productListItems = productsList!.length;
    if (productListItems == 0) {
      // product list is empty, so fill with empty rows
      for (int i = 0; i < noOfRows; i++) {
        tableRow.add(buildEmptyTableRow());
      }
    } else {
      // products list is not empty
      for (int i = 0; i < productListItems; i++) {
        tableRow.add(buildTableRowWithContent(productsList[i], i));
      }
      // fill rest with empty rows
      for (int i = 0; i < (noOfRows - productListItems); i++) {
        tableRow.add(buildEmptyTableRow());
      }
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
              '${itemNo+1}',
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
            child: GetBuilder<AddStoreController>(
                builder: (addStoreControllerState) {
              bool isDeleteOperationProcessing =
                  addStoreControllerState.isDeleteOperationProcessing;
              return IconButton(
                splashRadius: 20,
                onPressed: () {
                  // delete
                  Store? selectedStore =
                      Get.find<StoresController>().selectedStore;
                  if (selectedStore != null) {
                    // TODO: show warning dialog
                    showDeleteWarning(
                        addStoreControllerState, product, selectedStore);
                    // show success dialog after deletion, better to do that in home screen
                  }
                },
                icon: const Icon(
                  Icons.delete_outline_outlined,
                  color: Color(0XFF2E6BDC),
                ),
              );
            }),
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

  TableRow buildEmptyTableRow() {
    double rowHeight = 44;
    double vPadding = 4;
    double hPadding = 4;
    double fontSize = 14;

    return TableRow(children: [
      ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: rowHeight,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
          child: Text(
            textAlign: TextAlign.center,
            '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: rowHeight,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          child: Text(
            textAlign: TextAlign.center,
            '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: rowHeight,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          child: Text(
            textAlign: TextAlign.center,
            '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: rowHeight,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          child: Text(
            textAlign: TextAlign.center,
            '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: rowHeight,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          child: Text(
            textAlign: TextAlign.center,
            '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: rowHeight,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          child: Text(
            textAlign: TextAlign.center,
            '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: rowHeight,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          child: Text(
            textAlign: TextAlign.center,
            '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ]);
  }

  showDeleteWarning(
      AddStoreController addStoreController, Product product, Store store) {
    WarningDialog warningDialog = WarningDialog(
      'Do you want to Delete the Product details?',
      () {
        // yes
        // delete the product
        // closing the dialog
        Get.back();
        deleteProduct(addStoreController, store, product);
      },
      () {
        // no
        // closing the dialog
        Get.back();
      },
    );
    Get.dialog(
      warningDialog,
      barrierDismissible: false,
    );
  }

  deleteProduct(
      // this can be async method
      AddStoreController addStoreController,
      Store store,
      Product product) {
    addStoreController.deleteProduct(store, product);
    // if success
    showDeleteSuccessDialog();
  }

  showDeleteSuccessDialog() {
    SuccessDialog successDialog = SuccessDialog(
      'Details Deleted Successfully',
      () {
        // closing the dialog and navigating back
        Get.back(closeOverlays: true);
      },
    );
    Get.dialog(
      successDialog,
      barrierDismissible: false,
    );
  }
}
