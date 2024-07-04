import 'package:file_picker/file_picker.dart';
import 'package:fleetmasta/components/custom_txtbox.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/form_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class AddNewInvoiceController extends GetxController {
  TextEditingController idController = TextEditingController();
  TextEditingController invoiceDate = TextEditingController();
  TextEditingController invoiceQty = TextEditingController();
  TextEditingController invoicePrice = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();
  final GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  var invoices = <String>[].obs;
  RxList<InvoiceItem> invoiceItems = <InvoiceItem>[].obs;
  TextEditingController subtotalDisplayController = TextEditingController();
  RxString subtotalDisplay = '0.00'.obs;
  @override
  void onInit() {
    idController.text = 'Expense ID';
    subtotalDisplayController.text = '0.00';
    super.onInit();
    updateSubtotalDisplay();

  }

  void calculateTotal() {
    int qty = int.tryParse(invoiceQty.text) ?? 0;
    double price = double.tryParse(invoicePrice.text) ?? 0.0;
    double total = qty * price;
    totalPriceController.text = total.toString();
    updateSubtotalDisplay();
  }


  Future<void> selectInvoiceDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      invoiceDate.text = formattedDate;
    }
  }

  void submit() {
    if (formGlobalKey.currentState!.validate()) {
      Get.snackbar("Success", "Data uploaded successfully.");
    }
  }


  void removeInvoice(int index) {
    invoiceItems.removeAt(index);
    updateSubtotalDisplay();
  }


  void addInvoiceItem() {
    invoiceItems.add(InvoiceItem());
    updateSubtotalDisplay();
  }

  void calculateTotal1(int index) {
    final item = invoiceItems[index];
    final qty = double.tryParse(item.qtyController.text) ?? 0;
    final price = double.tryParse(item.priceController.text) ?? 0;
    item.totalPriceController1.text = (qty * price).toStringAsFixed(2);
    updateSubtotalDisplay();
  }

  double getSubtotal() {
    double subtotal = 0.0;
    for (var item in invoiceItems) {
      subtotal += double.tryParse(item.totalPriceController1.text) ?? 0.0;
    }
    return subtotal;
  }

  getGrandTotal() {
    double subtotal = getSubtotal();
    double additionalTotal = double.tryParse(totalPriceController.text) ?? 0.0;
    return
      subtotal + additionalTotal;
  }

  void updateSubtotalDisplay() {
    subtotalDisplay.value = getGrandTotal().toStringAsFixed(2);
  }


}


class InvoiceItem {
  final TextEditingController qtyController;
  final TextEditingController priceController;
  final TextEditingController totalPriceController1;

  InvoiceItem()
      : qtyController = TextEditingController(),
        priceController = TextEditingController(),
        totalPriceController1 = TextEditingController();
}

