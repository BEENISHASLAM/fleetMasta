import 'package:fleetmasta/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalButtonList extends StatefulWidget {
  final List<String> categories;
  final Function(String) onCategorySelected;
  final int initialIndex; // Add this parameter

  HorizontalButtonList({
    required this.categories,
    required this.onCategorySelected,
    this.initialIndex = 0, // Default value is 0
  });

  @override
  _HorizontalButtonListState createState() => _HorizontalButtonListState();
}

class _HorizontalButtonListState extends State<HorizontalButtonList> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Initialize with the provided initial index
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, // Set the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                });
                widget.onCategorySelected(widget.categories[index]);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                side: MaterialStateProperty.all(
                  BorderSide(color: _selectedIndex == index ? Appcolor.purple : Appcolor.grey),
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Appcolor.white; // Change to your desired color when pressed
                    }
                    return _selectedIndex == index ? Appcolor.white : Colors.transparent; // Default colors
                  },
                ),
              ),
              child: Text(
                widget.categories[index],
                style: TextStyle(
                  fontSize: 14,
                  color: _selectedIndex == index ? Appcolor.purple : Appcolor.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

