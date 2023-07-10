import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../store_details/store_more_details_page_mobile.dart';
import '../../domain/store_data_model.dart';

class StoreListItemMobile extends StatelessWidget {
  Store store;
  int itemNo;

  StoreListItemMobile(this.store, this.itemNo);

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
                'Store ID',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${store.storeId}',
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
                'Store Name',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${store.storeName}',
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
                'Domain ID',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${store.domainId}',
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
                'Established Year',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${store.establishYear}',
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
                'Headquarter Location',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${store.location}',
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
                'Actions',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    constraints:
                        const BoxConstraints(maxWidth: 24, maxHeight: 24),
                    padding: EdgeInsets.zero,
                    iconSize: 20,
                    splashRadius: 15,
                    onPressed: () {
                      Get.to(() => StoreMoreDetailsPageMobile(store));
                    },
                    icon: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color(0XFF2E6BDC),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
