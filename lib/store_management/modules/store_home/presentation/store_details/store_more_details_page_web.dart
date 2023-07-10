import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../home/presentation/custom_scaffold_web.dart';
import '../../domain/store_data_model.dart';
import 'products_table_without_action_web.dart';
import 'store_form_web.dart';

class StoreMoreDetailsPageWeb extends StatelessWidget {
  Store store;

  StoreMoreDetailsPageWeb(this.store);

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWeb(
      child: Scaffold(
        backgroundColor: const Color(0XFFF7F7F7),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40.w,
              vertical: 18,
            ),
            child: Column(
              children: [
                // top path item
                Row(
                  children: const [
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0XFF2E6BDC),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '>',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Store Management System',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0XFF2E6BDC),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 48,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  // to align with card
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    color: Color(0XFF2E6BDC),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                    ),
                  ),
                  child: const Text(
                    'Store Management System',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Expanded(
                //   child:
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        StoreFormWeb(
                            store: store,
                            canEdit: false,
                            withInitialValue: true),
                        const SizedBox(
                          height: 30,
                        ),
                        // const ProductsTableWebOld(),
                        ProductsTableWithoutActionWeb(store),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 8)),
                                minimumSize: const MaterialStatePropertyAll(
                                    Size(125, 40)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Color(0XFF2E6BDC)),
                              ),
                              child: const Text(
                                'Back',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
