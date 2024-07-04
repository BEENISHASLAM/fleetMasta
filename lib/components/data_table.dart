// expense_table.dart
import 'package:fleetmasta/const/custom_text.dart';
import 'package:flutter/material.dart';

class ExpenseTable extends StatefulWidget {
  final List<Map<String, String>> data;
  final List<String> columns;

  ExpenseTable({required this.data, required this.columns});

  @override
  _ExpenseTableState createState() => _ExpenseTableState();
}

class _ExpenseTableState extends State<ExpenseTable> {
  int currentRowPage = 0;
  int rowsPerPage = 3;

  final ScrollController _scrollController = ScrollController();
  final double scrollAmount = 200.0;

  @override
  Widget build(BuildContext context) {
    int totalRows = widget.data.length;
    int totalRowPages = (totalRows / rowsPerPage).ceil();

    List<DataColumn> getCurrentPageColumns() {
      return widget.columns.map((column) => DataColumn(label: grayText(column))).toList();
    }

    List<DataRow> getCurrentPageRows() {
      int startIndex = currentRowPage * rowsPerPage;
      int endIndex = startIndex + rowsPerPage;
      if (endIndex > totalRows) endIndex = totalRows;

      return widget.data
          .sublist(startIndex, endIndex)
          .map((item) => DataRow(
        cells: widget.columns.map((col) => DataCell(grayTex1(item[col]!))).toList(),
      ))
          .toList();
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: DataTable(
              columns: getCurrentPageColumns(),
              rows: getCurrentPageRows(),
            ),
          ),
        ],
      ),
    );
  }
}
