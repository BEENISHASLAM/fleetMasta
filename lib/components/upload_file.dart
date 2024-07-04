import 'package:dotted_border/dotted_border.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:flutter/material.dart';

class FileUploadField extends StatelessWidget {
  final onPickFile;
  final controller;
  final onValidate;

  FileUploadField({this.onValidate, this.controller , required this.onPickFile});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.grey, // Color of the border
      strokeWidth: 2, // Width of the border
      dashPattern: [6, 3], // Pattern of the dashed border
      borderType: BorderType.Rect, // Border type
      radius: const Radius.circular(12),
      child: TextFormField(
        validator: onValidate,
             controller:  controller,
            decoration: InputDecoration(
              hintText: 'Choose file to upload',
          errorStyle: const TextStyle(height: 0),
          filled: true,
          hintStyle: TextStyle(color: Appcolor.grey),
          fillColor: Appcolor.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
            // borderSide: BorderSide(color: Appcolor.white, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.red),

          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
            readOnly: true, // Make the text field read-only
          )
    );
  }
}

