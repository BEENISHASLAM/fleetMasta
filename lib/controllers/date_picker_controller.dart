import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class DatePickerController extends ChangeNotifier {
  TextEditingController driverLicenseExp = TextEditingController();
  TextEditingController tachoCardExp = TextEditingController();
  TextEditingController cpcCardExp = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController empEndDate = TextEditingController();
  TextEditingController empStartDate = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController passportExpiryDate = TextEditingController();

  DatePickerController() {
    driverLicenseExp.text = ""; // set the initial value of text field
    tachoCardExp.text="";
    expiryDate.text='';
    dateOfBirth.text='';
    passportExpiryDate.text="";
    cpcCardExp.text="";
    empEndDate.text="2024-05-30";
    empStartDate.text="2024-02-03";
  }

  Future<void> selectDateLicenceExp(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      driverLicenseExp.text = formattedDate;
      notifyListeners(); // notify listeners to update the UI
    }
  }


  Future<void> selectTechoCardExp(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      tachoCardExp.text = formattedDate;

      notifyListeners(); // notify listeners to update the UI
    }
  }
  Future<void> SelectExpiryDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      expiryDate.text = formattedDate;

      notifyListeners(); // notify listeners to update the UI
    }
  }
  Future<void> selectDateOfBirth(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateOfBirth.text = formattedDate;

      notifyListeners(); // notify listeners to update the UI
    }
  }
  Future<void> selectPassportExDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      passportExpiryDate.text = formattedDate;
      notifyListeners(); // notify listeners to update the UI
    }
  }
  Future<void> selectCpcCardExDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      cpcCardExp.text = formattedDate;

      notifyListeners(); // notify listeners to update the UI
    }
  }

  Future<void> selectEmpStartDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      empStartDate.text = formattedDate;

      notifyListeners(); // notify listeners to update the UI
    }
  }
  Future<void> selectEmpEndDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      empEndDate.text = formattedDate;

      notifyListeners(); // notify listeners to update the UI
    }
  }
}