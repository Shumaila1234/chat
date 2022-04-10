import 'package:flutter/material.dart';

import '../shared/app-theme.dart';

Widget customHeadingText(context, text, fontsize, fontWeight) {
  return Align(
    alignment: Alignment.topLeft,
    child: Text(
      text,
      style: TextStyle(
          fontSize: fontsize,
          color: blackColor,
          fontFamily: fontFamily,
          fontWeight: fontWeight),
    ),
  );
}

Widget customText(context, text, fontsize, fontWeight, color) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontsize,
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight),
  );
}

Widget customText1(context, text, fontsize, fontWeight, color, bgColor) {
  return Text(
    text,
    style: TextStyle(
        background: bgColor,
        fontSize: fontsize,
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight),
  );
}
