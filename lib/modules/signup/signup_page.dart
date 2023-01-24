// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:foodsapp/controller/auth_controller.dart';
import 'package:foodsapp/modules/utils/dimensions.dart';
import 'package:get/get.dart';

import '../login/web_login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final authC = Get.find<AuthController>();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height20,
                  horizontal: Dimensions.width20),
              child: Container(
                height: Dimensions.pageViewContainer2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logoBabi.png'),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailC,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordC,
                        decoration: const InputDecoration(
                          labelText: "Pasword",
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Date of birth",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "must be filled";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      RichText(
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: "By signing up, you agree to our",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: " Terms, Data Policy ",
                                style: TextStyle(color: Colors.lightBlue)),
                            TextSpan(
                                text: " and ",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                              text: "Cookies Policy",
                              style: TextStyle(color: Colors.lightBlue),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      ButtonTheme(
                        minWidth: 500,
                        height: 70,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.purple.shade800),
                          ),
                          color: Colors.purple.shade800,
                          textColor: Colors.white,
                          child: const Text("Register",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          onPressed: () =>
                              authC.signup(emailC.text, passwordC.text),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      ButtonTheme(
                        minWidth: 500,
                        height: 70,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Colors.indigo),
                          ),
                          color: Colors.white,
                          textColor: Colors.indigo,
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Get.to(const WebLogin());
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
