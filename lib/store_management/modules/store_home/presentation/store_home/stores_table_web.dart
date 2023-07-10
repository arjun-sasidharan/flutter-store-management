import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_management_flutter/store_management/modules/store_home/presentation/store_details/store_more_details_page_web.dart';

import '../../../../store_common/widgets/loading_spinner.dart';
import '../../application/stores_controller.dart';
import '../../domain/store_data_model.dart';

class StoresTableWeb extends StatelessWidget {
  const StoresTableWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoresController>(builder: (storesControllerState) {
      if (storesControllerState.isLoading) {
        return const SizedBox(
          height: 44 * 2, // height of two table row
          child: Center(
            child: LoadingSpinner(),
          ),
        );
      }
      // if (storesControllerState.storesList!.isEmpty) {
      //   return const Text('Stores data not available');
      // }
      return Column(
        children: [
          Table(
            columnWidths: const {
              0: FixedColumnWidth(60), // width of first column
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(1),
              5: FlexColumnWidth(1.5),
              6: FixedColumnWidth(80),
            },
            border: TableBorder.all(color: Colors.grey),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            // how item are vertically aligned in a row
            children: buildTableRows(storesControllerState.storesList),
          ),
          if (storesControllerState.storesList.isEmpty)
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
                          'Stores data not available',
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
            ),
        ],
      );
    });
  }

  List<TableRow> buildTableRows(List<Store>? storesList) {
    List<TableRow> tableRow = [];
    // adding heading
    tableRow.add(tableHeadingRow());
    int storeItemList = storesList!.length;
    for (int i = 0; i < storeItemList; i++) {
      tableRow.add(buildTableRowWithContent(storesList[i], i));
    }
    return tableRow;
  }

  // table row builder
  TableRow buildTableRowWithContent(Store store, int itemNo) {
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
              '${store.storeId}',
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
              '${store.storeName}',
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
              '${store.domainId}',
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
              '${store.establishYear}',
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
              '${store.location}',
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
                Get.to(() => StoreMoreDetailsPageWeb(store),
                    routeName:
                        'store_management/store-details-${store.storeId}');
              },
              icon: const Icon(
                Icons.remove_red_eye_outlined,
                color: Color(0XFF2E6BDC),
              ),
            ),
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
              'Store ID',
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
              'Store Name',
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
              'Domain ID',
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
              'Est. Year',
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
              'Headquarter Location',
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
