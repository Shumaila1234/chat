import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../shared/app-theme.dart';
import '../shared/hexColor.dart';

Widget customCountryPicker(context, text, onselect) {
  return PhysicalModel(
      borderRadius: BorderRadius.circular(10),
      elevation: 5.0,
      shadowColor: Colors.grey.withOpacity(0.5),
      color: Colors.white,
      child: InkWell(
          onTap: () {
            showCountryPicker(
              context: context,
              exclude: <String>['KN', 'MF'],
              showPhoneCode: false,
              showWorldWide: false,
              onSelect: onselect,
              countryListTheme: CountryListThemeData(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                inputDecoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                        color: HexColor(textfieldBorderColor), width: 2.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  labelText: 'Search',
                  hintText: 'Start typing to search',
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                ),
              ),
            );
          },
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 3),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: fontFamily,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.07,
          )));
}
