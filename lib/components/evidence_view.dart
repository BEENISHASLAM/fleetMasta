import 'package:flutter/material.dart';

class EvidenceUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double itemHeight =900; // Adjust this height as needed
    final int itemCount = 13; // Total number of items in the grid
    final int crossAxisCount = 2; // Number of columns in the grid
    final int rowCount = (itemCount / crossAxisCount).ceil(); // Calculate the number of rows

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: rowCount * itemHeight, // Set the height of the container to fit all items
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(), // Prevent the GridView from scrolling
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            DocumentWidget(
              label: 'Proof of ID\n(Driver\'s licence)',
              imageName: 'assets/images/Doc.png',
            ),
            DocumentWidget(
              label: 'Right to work\n(Passport or work permit)',
              imageName: 'assets/images/Doc.png',
            ),
            DocumentWidget(
              label: 'Proof of address\n(Utility bill, bank statement)',
              imageName: 'assets/images/Doc.png',
            ),
            DocumentWidget(
              label: 'Front of driver\'s licence',
              imageName: 'assets/images/Doc.png',
            ),
            DocumentWidget(
              label: 'Back of driver\'s licence',
              imageName: 'assets/images/Doc.png',
            ),
            DocumentWidget(
              label: 'Proof of P45',
              imageName: 'assets/images/Doc.png',
            ),
            DocumentWidget(
              label: 'Licence verification check',
              imageName: 'assets/images/Doc.png',
            ),
            DocumentWidget(
              label: 'Front of your tacho card',
              imageName: 'assets/images/Doc.png',
            ),
            DocumentWidget(
              label: 'Back of your tacho card',
              imageName: 'assets/images/Doc.png',
            ),
            DocumentWidget(
              label: 'Front of your CPC card',
              imageName: 'assets/images/Doc.png',
            ),
            DocumentWidget(
              label: 'Back of your CPC card',
              imageName: 'assets/images/Doc.png',
            ),
            DocumentWidget(
              label: 'Background check',
              imageName: 'assets/images/Doc.png',
            ),
            DocumentWidget(
              label: 'Drug and Alcohol test',
              imageName: 'assets/images/Doc.png',
            ),
          ],
        ),
      ),
    );
  }
}

class DocumentWidget extends StatelessWidget {
  final String label;
  final String imageName;

  DocumentWidget({required this.label, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        Expanded(
          child: Image.asset(imageName),
        ),
      ],
    );
  }
}
