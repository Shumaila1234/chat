import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../shared/app-theme.dart';
import '../shared/hexColor.dart';

class PhoneNumberCustom extends StatefulWidget {
  TextEditingController controller;
  final validator;

  final inputchange;
  PhoneNumber initialValue;

  PhoneNumberCustom(
      {required this.controller,
      required this.inputchange,
      required this.validator,
      required this.initialValue});

  @override
  State<PhoneNumberCustom> createState() => _PhoneNumberCustomState();
}

class _PhoneNumberCustomState extends State<PhoneNumberCustom> {
  PhoneNumber number = PhoneNumber(isoCode: 'PK');

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(10),
      elevation: 5.0,
      shadowColor: Colors.grey.withOpacity(0.5),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            child: InternationalPhoneNumberInput(
              inputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                labelText: "",
                labelStyle: const TextStyle(
                  fontFamily: fontFamily,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor(textfieldBorderColor)),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.white, width: 2.0)),
              ),
              textStyle:
                  const TextStyle(fontFamily: fontFamily, color: Colors.black),
              validator: widget.validator,
              hintText: "Phone number ",
              maxLength: 11,
              spaceBetweenSelectorAndTextField: 0,
              onInputChanged: widget.inputchange,
              onInputValidated: (bool value) {},
              initialValue: widget.initialValue,
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DIALOG,
              ),
              ignoreBlank: false,
              // isEnabled: false,
              // autoValidateMode: AutovalidateMode.onUserInteraction,
              selectorTextStyle: const TextStyle(color: Colors.black),
              textFieldController: widget.controller,
              formatInput: true,
              selectorButtonOnErrorPadding: 5,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              inputBorder: const OutlineInputBorder(),
            )),
      ),
    );
  }
}
