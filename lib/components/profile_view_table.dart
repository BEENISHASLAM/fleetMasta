import 'package:fleetmasta/const/colors.dart';
import 'package:flutter/material.dart';


class EmployeeDetailsCard extends StatelessWidget {
  final List<Map<String, String>> details;
  EmployeeDetailsCard({required this.details});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:Appcolor.bbg1,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: details.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(color: Appcolor.white,);
          },
          itemBuilder: (BuildContext context, int index) {
            return EmployeeDetailRow(
              label: details[index]['label']!,
              value: details[index]['value']!,
            );
          },
        ),
      ),
    );

  }
}

class EmployeeDetailRow extends StatelessWidget {
  final String label;
  final String value;

  EmployeeDetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Appcolor.lightBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color:Appcolor.lightBlack
            ),
          ),
        ],
      ),
    );
  }
}
