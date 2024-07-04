import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:flutter/material.dart';



class profileConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Appcolor.grey,
        body: ConfirmationDialog(),
      );
  }
}

class ConfirmationDialog extends StatefulWidget {
  @override
  _ConfirmationDialogState createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: grayText(
                    'Are you sure you want to submit your profile? Please check and ensure your profile information is correct. If the profile is rejected, you will have to complete the profile again. Click ok to continue.',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Appcolor.grey, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(width: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Appcolor.green, // background
                    onPrimary: Appcolor.white, // foreground
                  ),
                  onPressed: isChecked
                      ? () {
                    // Handle submit action
                  }
                      : null,
                  child: Text('Ok'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
