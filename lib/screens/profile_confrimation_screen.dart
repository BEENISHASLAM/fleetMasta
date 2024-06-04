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
                    'I confirm that all the information provided is true and complete and that I understand that any falsification or deliberate omissions may disqualify my application or lead to my dismissal. I confirm that I am entitled to work in the UK and can provide original documentation to confirm this. I understand that my employment is subject to satisfactory references. I consent to the information I have given on this application form and in all other enclosed documentation being held, used and updated under the security safeguards of the Data Protection Act 1998 and GDPR May 25th 2018.',
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
                  child: Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
