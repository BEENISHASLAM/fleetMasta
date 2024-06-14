import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdown extends FormField<String> {
  CustomDropdown({
    Key? key,
    required List<String> items,
    String? selectedValue,
    ValueChanged<String?>? onChanged,
    String? text,
    String? errorMessage,
    FormFieldValidator<String>? validator,
  }) : super(
    key: key,
    validator: validator,
    initialValue: selectedValue,
    builder: (FormFieldState<String> state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Row(
                children: [
                  Text(
                    text ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(136, 136, 136, 1),
                    ),
                    overflow: TextOverflow.ellipsis,

                  ),
                ],
              ),
              items: items.map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(136, 136, 136, 1),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )).toList(),
              value: state.value,
              onChanged: (String? value) {
                state.didChange(value);
                if (onChanged != null) {
                  onChanged(value);
                }
              },
              buttonStyleData: ButtonStyleData(
                height: 55,
                padding: const EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.fromBorderSide(
                    BorderSide(color: state.hasError ? Colors.red : Colors.white),
                  ),
                  color: Colors.white,
                ),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                ),
                iconSize: 25,
                iconEnabledColor: Color.fromRGBO(136, 136, 136, 1),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: 320,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(12),

                ),
                offset: const Offset(0, 0),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all<double>(6),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.only(left: 40, right: 50),
              ),
            ),
          ),
          if (state.hasError)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                state.errorText ?? '',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  height: 0,

                ),
              ),
            ),
        ],
      );
    },
  );
}
