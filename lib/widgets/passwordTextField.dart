import 'package:flutter/material.dart';

import '../shared/app-theme.dart';
import '../shared/hexColor.dart';

Widget customPasswordTextfield(
    context, controller, labeltext, _passwordVisibilty, tooglefunc) {
  return PhysicalModel(
      borderRadius: BorderRadius.circular(10),
      elevation: 5.0,
      shadowColor: Colors.grey.withOpacity(0.5),
      color: Colors.white,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        obscureText: !_passwordVisibilty,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: labeltext,
          suffixIcon: GestureDetector(
            onTap: tooglefunc,
            child: Icon(
              _passwordVisibilty ? Icons.visibility : Icons.visibility_off,
              color: iconColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: HexColor(textfieldBorderColor))),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),
      ));
}
