import 'dart:developer';
import 'package:flutter/material.dart';

class DataModel {
  final int id;
  final String name;
  final String email;
  final String number;

  DataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.number
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      number: json['number'],
    );
  }
}

class PaginatedDataTableView extends StatefulWidget {
  const PaginatedDataTableView({super.key});

  @override
  State<PaginatedDataTableView> createState() => _PaginatedDataTableViewState();
}

class _PaginatedDataTableViewState extends State<PaginatedDataTableView> {
  int _currentPage = 1;
  int _pageSize = 4;
  List<DataModel> _data = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    generateDummyData();
  }

  void generateDummyData() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      List<DataModel> newData = List.generate(
        _pageSize,
            (index) => DataModel(
          id: index + (_currentPage - 1) * _pageSize,
          name: 'User ${index + (_currentPage - 1) * _pageSize}',
          email: 'user${index + (_currentPage - 1) * _pageSize}@example.com',
              number: 'user${index + (_currentPage - 1) * _pageSize}',
        ),
      );

      setState(() {
        _data.addAll(newData);
        _isLoading = false;
      });
    });
  }

  void _loadMoreData() {
    if (!_isLoading) {
      setState(() {
        _currentPage++;
      });
      generateDummyData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Table'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: PaginatedDataTable(
            //header: const Text('Data Table Header'),
            rowsPerPage: _pageSize,
            availableRowsPerPage: const [4, 25, 50, 10],
            onRowsPerPageChanged: (value) {
              setState(() {
                _pageSize = value!;
                _currentPage = 1;
                _data.clear();
                generateDummyData();
              });
            },
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('number')),
            ],
            source: _DataSource(data: _data),
          ),
        ),
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  final List<DataModel> data;

  _DataSource({required this.data});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final item = data[index];

    return DataRow(cells: [
      DataCell(Text(item.id.toString())),
      DataCell(Text(item.name)),
      DataCell(Text(item.email)),
      DataCell(Text(item.number)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
