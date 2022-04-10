import 'package:flutter/material.dart';

import '../shared/app-theme.dart';
import '../shared/hexColor.dart';

Widget customTextFieldWithPlaceholder(
    context, labeltext, controller, keyboardType) {
  return PhysicalModel(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    elevation: 5.0,
    shadowColor: Colors.grey.withOpacity(0.5),
    child: SizedBox(
      // width: width,
      // height: 50.0,
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelText: labeltext,
              labelStyle: const TextStyle(
                fontFamily: fontFamily,
              ),
              hintStyle: const TextStyle(
                fontFamily: fontFamily,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide:
                      BorderSide(color: HexColor(textfieldBorderColor))),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}
