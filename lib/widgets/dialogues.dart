import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../shared/app-theme.dart';

var styleForAlert = const TextStyle(
    fontFamily: fontFamily,
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 25);

var alertStyleForTwoButtons = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: const TextStyle(
        fontFamily: fontFamily, color: Colors.black, fontSize: 15),
    titleStyle: styleForAlert);

var alertStyleForOneButton = const AlertStyle(
  animationType: AnimationType.fromTop,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle:
      TextStyle(fontFamily: fontFamily, color: Colors.black, fontSize: 15),
  titleStyle: TextStyle(
      fontFamily: fontFamily,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 25),
);

var styleForSingleTextFieldDialogue = const AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle:
        TextStyle(fontFamily: fontFamily, color: Colors.black, fontSize: 18),
    titleStyle: TextStyle(
        fontFamily: fontFamily,
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600));

var styleForMultiTextFieldDialogue = const AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle:
        TextStyle(fontFamily: fontFamily, color: Colors.black, fontSize: 18),
    titleStyle: TextStyle(
        fontFamily: fontFamily,
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600));

//two button
onAlertButtonsPressed(context, desc, title, onPressYes, onPressNo) {
  return Alert(
    context: context,
    style: alertStyleForTwoButtons,
    title: title,
    desc: desc,
    closeFunction: () {
      Navigator.pop(context);
    },
    buttons: [
      DialogButton(
          child: const Text(
            "Yes",
            style: TextStyle(
                fontFamily: fontFamily, color: Colors.white, fontSize: 18),
          ),
          onPressed: onPressYes,
          color: Colors.teal),
      DialogButton(
        child: const Text(
          "No",
          style: TextStyle(
              fontFamily: fontFamily, color: Colors.white, fontSize: 18),
        ),
        onPressed: onPressNo,
        color: Colors.teal,
      )
    ],
  ).show(); // here need to change
}

//one button
showSuccessfulDialogue(context, desc, title, onPressButton) {
  return Alert(
    context: context,
    style: alertStyleForOneButton,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
          child: const Text(
            "Okay",
            style: TextStyle(
                fontFamily: fontFamily, color: Colors.white, fontSize: 14),
          ),
          onPressed: onPressButton,
          color: appThemeColor),
    ],
  ).show(); // here need to change
}

//one button
showAlertDialogue(context, desc, title, onPressButton) {
  return Alert(
    context: context,
    style: alertStyleForTwoButtons,
    title: title,
    desc: desc,
    closeFunction: () {
      Navigator.pop(context);
    },
    buttons: [
      DialogButton(
          child: const Text("Okay",
              style: TextStyle(
                  fontFamily: fontFamily, color: Colors.white, fontSize: 18)),
          onPressed: onPressButton,
          color: Colors.teal),
    ],
  ).show(); // here need to change
}
