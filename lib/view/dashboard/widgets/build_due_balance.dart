import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/constants/colors.dart';

Widget buildDueBalance() {
  return DataTable(
    dividerThickness: 0,
    columnSpacing: 20.w,
    columns: [
      DataColumn(
          label: subTitleText('Due ID',
              size: 12, color: primaryColor, fontWeight: FontWeight.w500)),
      DataColumn(
          label: subTitleText('Due Date',
              size: 12, color: primaryColor, fontWeight: FontWeight.w500)),
      DataColumn(
          label: subTitleText('Amount',
              size: 12, color: primaryColor, fontWeight: FontWeight.w500)),
      DataColumn(
          label: subTitleText('Status',
              size: 12, color: primaryColor, fontWeight: FontWeight.w500)),
      DataColumn(
          label: subTitleText('Pay Now',
              size: 12, color: primaryColor, fontWeight: FontWeight.w500)),
    ],
    rows: [

      for (int i = 0; i < 5; i++)
        DataRow(
          cells: [
            DataCell(subTitleText('10', size: 12, fontWeight: FontWeight.w300)),
            DataCell(
                subTitleText('3/04/23', size: 12, fontWeight: FontWeight.w300)),
            DataCell(
                subTitleText('\$78860', size: 12, fontWeight: FontWeight.w300)),
            DataCell(
              Container(
                  height: 12.h,
                  width: 12.w,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: const Icon(Icons.done, size: 8, color: white)),
            ),
            const DataCell(
                Icon(Icons.credit_card, size: 12, color: orangeLight)),
          ],
        )
    ],
  );
}
