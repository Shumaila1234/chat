import 'package:chat/widgets/dialogues.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../shared/app-theme.dart';
import '../../shared/sizedbox.dart';
import '../../widgets/button.dart';
import '../../widgets/country-picker.dart';
import '../../widgets/passwordTextField.dart';
import '../../widgets/phone-number.dart';
import '../../widgets/text.dart';
import '../../widgets/textfield-placeholder.dart';
import '../login/login.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController villageController = TextEditingController();

  late DatabaseReference _dbref;

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
  }

  var myFormat = DateFormat('dd-MM-yyyy');
  var finalPhoneNumber = "";
  String? selectedValue;
  var countryName = "";
  var countryCode = "";
  var countryCodeName = "";
  bool _isLoading = false;
  PhoneNumber number = PhoneNumber();
  List<String> genderList = ['Female', 'Male'];
  final String _selectedGender = "Female";
  final _registerFormKey = GlobalKey<FormState>();
  bool _passwordVisibilty = false;
  void togglePasswordVisibility() =>
      setState(() => _passwordVisibilty = !_passwordVisibilty);

  _getRegister() {
    _dbref.child("jobprofile").set(
        {'email': emailController.text, "password": passwordController.text});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Form(
              key: _registerFormKey,
              child: Column(
                children: [
                  const SizedBox10(),

                  Column(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.image),
                        radius: 60,
                      ),
                      SizedBox5(),
                      Align(
                        alignment: Alignment.topCenter,
                        child: customText(context, "Please add your image",
                            15.0, FontWeight.w400, Colors.red),
                      ),
                    ],
                  ),

                  const SizedBox20(),
                  customTextFieldWithPlaceholder(
                      context, "Email", emailController, TextInputType.text),
                  const SizedBox20(),
                  customPasswordTextfield(context, passwordController,
                      'Password', _passwordVisibilty, () {
                    togglePasswordVisibility();
                  }),
                  const SizedBox20(),
                  customPasswordTextfield(context, confirmPasswordController,
                      'Confirm Password', _passwordVisibilty, () {
                    togglePasswordVisibility();
                  }),
                  const SizedBox20(),
                  customTextFieldWithPlaceholder(
                      context, "Name", fullNameController, TextInputType.text),
                  const SizedBox20(),
                  customTextFieldWithPlaceholder(context, "Father Name",
                      fatherNameController, TextInputType.text),

                  const SizedBox20(),
                  customCountryPicker(
                    context,
                    countryName == "" ? "Select country name" : countryName,
                    (Country country) {
                      setState(() {
                        countryName = country.name;
                        // number = country.countryCode as PhoneNumber;
                        // print(country.countryCode);
                        number = PhoneNumber(isoCode: country.countryCode);
                      });
                    },
                  ),
                  const SizedBox20(),
                  PhoneNumberCustom(
                    controller: phoneNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This is required field';
                      } else if (value[0] == "0") {
                        return 'Number should not start with 0';
                      }

                      return null;
                    },
                    inputchange: (PhoneNumber number) {
                      setState(() {
                        finalPhoneNumber = number.phoneNumber.toString();
                      });
                    },
                    initialValue: number,
                  ),

                  //                 Container(
                  //   height: 50,
                  //   width: MediaQuery.of(context).size.width,
                  //   margin: EdgeInsets.all(20),
                  //   child: DropdownButtonHideUnderline(
                  //     child: GFDropdown(
                  //       padding: const EdgeInsets.all(15),
                  //       borderRadius: BorderRadius.circular(5),
                  //       border: const BorderSide(
                  //           color: Colors.black12, width: 1),
                  //       dropdownButtonColor: Colors.white,
                  //       value: _selectedGender,
                  //       onChanged: (newValue) {
                  //         setState(() {
                  //           _selectedGender = newValue.toString();
                  //         });
                  //       },
                  //       items: [
                  //         'Female',
                  //         'Male',

                  //       ]
                  //           .map((value) => DropdownMenuItem(
                  //         value: value,
                  //         child: Text(value),
                  //       ))
                  //           .toList(),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox20(),

                  customTextFieldWithPlaceholder(
                      context, "Area", areaController, TextInputType.text),
                  const SizedBox20(),
                  customTextFieldWithPlaceholder(context, "Profession",
                      professionController, TextInputType.text),
                  const SizedBox20(),
                  customTextFieldWithPlaceholder(context, "Village",
                      villageController, TextInputType.text),
                  const SizedBox20(),
                  customButton(
                      context,
                      _isLoading == true
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "REGISTER NOW",
                              style: TextStyle(
                                  fontSize: 20, fontFamily: "Poppins"),
                            ),
                      MediaQuery.of(context).size.width * 0.9,
                      MediaQuery.of(context).size.height * 0.07, () {
                    _getRegister();
                  }),

                  const SizedBox10(),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(context, "Already have an Account? ", 15.0,
                            FontWeight.normal, blackColor),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginBody()));
                          },
                          child: customText(context, "Sign in", 15.0,
                              FontWeight.normal, appThemeColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
