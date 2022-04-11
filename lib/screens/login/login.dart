import 'package:chat/screens/signup/signup.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../shared/app-theme.dart';
import '../../shared/sizedbox.dart';
import '../../widgets/button.dart';
import '../../widgets/passwordTextField.dart';
import '../../widgets/text.dart';
import '../../widgets/textfield-placeholder.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  bool _passwordVisibilty = false;
  PhoneNumber number = PhoneNumber();
  late DatabaseReference _dbref;

  var getemail = "";
  var getpassword = "";

  void togglePasswordVisibility() =>
      setState(() => _passwordVisibilty = !_passwordVisibilty);

  _getLogin() {
    _dbref.child("register").child("email").once().then((event) {
      final dataSnapshot = event.snapshot;
      if (dataSnapshot.value != null) {
        setState(() {
          getemail = dataSnapshot.value.toString();
          // getpassword = dataSnapshot.value.toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox100(),
                const SizedBox40(),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"),
                      ),
                      customTextFieldWithPlaceholder(
                          context, "", emailController, TextInputType.text),
                    ],
                  ),
                ),
                const SizedBox10(),
                customPasswordTextfield(
                    context, passwordController, 'Password', _passwordVisibilty,
                    () {
                  togglePasswordVisibility();
                }),
                const SizedBox10(),
                InkWell(
                  onTap: () {},
                  child: customHeadingText(
                      context, "Forgot Password?", 15.0, FontWeight.normal),
                ),
                const SizedBox20(),
                customButton(
                  context,
                  _isLoading == true
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          "LOGIN",
                          style: const TextStyle(
                              fontSize: 20, fontFamily: "Poppins"),
                        ),
                  MediaQuery.of(context).size.width * 0.9,
                  MediaQuery.of(context).size.height * 0.07,
                  () async {},
                ),
                const SizedBox20(),
                Center(
                    child: customText(
                        context, "OR", 18.0, FontWeight.w500, Colors.black)),
                const SizedBox10(),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(context, "Don't have an account? ", 15.0,
                          FontWeight.normal, blackColor),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupBody()));
                        },
                        child: customText(context, "Sign up", 15.0,
                            FontWeight.normal, appThemeColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
