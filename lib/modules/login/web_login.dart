import 'package:flutter/material.dart';
import 'package:foodsapp/controller/auth_controller.dart';
import 'package:foodsapp/modules/signup/signup_page.dart';
import 'package:foodsapp/modules/utils/dimensions.dart';
import 'package:get/get.dart';

class WebLogin extends StatefulWidget {
  const WebLogin({Key? key}) : super(key: key);

  @override
  State<WebLogin> createState() => _WebLoginState();
}

class _WebLoginState extends State<WebLogin> {
  final _formKey = GlobalKey<FormState>();
  bool check = false;
  late PageController pageController;
  final int _pageIndex = 0;

  final authC = Get.find<AuthController>();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  @override
  void initState() {
    pageController = PageController(initialPage: _pageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _loginContainer(),
      ),
    );
  }

  Widget _loginContainer() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            height: Dimensions.pageViewContainer2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/logoBabi.png'),
                  fit: BoxFit.scaleDown),
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text("Login to Your Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Expanded(
            child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                TextFormField(
                  controller: emailC,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                TextFormField(
                  controller: passwordC,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                CheckboxListTile(
                  title: const Text("Remember me"),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: check,
                  onChanged: (value) => setState(
                    () {
                      check = !check;
                    },
                  ),
                  activeColor: Colors.indigo,
                  checkColor: Colors.white,
                ),
                ButtonTheme(
                  minWidth: Get.width,
                  height: 60,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.purple.shade800),
                    ),
                    color: Colors.purple.shade800,
                    textColor: Colors.white,
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () => authC.login(emailC.text, passwordC.text),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Or login with",
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 75,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Dimensions.height30,
                            height: Dimensions.height30,
                            child: Image.asset(
                              "assets/google.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: 75,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset(
                                "assets/facebook.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        )),
                    Container(
                      width: 75,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Dimensions.height30,
                            height: Dimensions.height30,
                            child: Image.asset(
                              "assets/twitter.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an accoun't ? ",
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      onTap: () {
                        Get.to(const SignUpPage());
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }

  // ignore: unused_element
  // Widget _fullScreenWeb() {
  //   return SizedBox(
  //     width: Get.width,
  //     height: Get.height,
  //     child: Row(
  //       mainAxisSize: MainAxisSize.max,
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //           child: Expanded(
  //             child: PageView(
  //               controller: pageController,
  //               onPageChanged: (value) {
  //                 setState(() {
  //                   _pageIndex = value;
  //                   if (_pageIndex < _pagesIntro().length) {}
  //                 });
  //               },
  //               children: _pagesIntro(),
  //             ),
  //           ),
  //         ),
  //         _loginContainer()
  //       ],
  //     ),
  //   );
  // }

  // List<Widget> _pagesIntro() {
  //   return [
  //     HomeON(
  //       title: "Tittle One",
  //       subtitle: "Lorem ipsum dolor sit amet la maryame dor sut colondeum",
  //       imge: "assets/firstpage.png",
  //       index: 0,
  //       onTap: () {
  //         setState(() {
  //           pageController.animateToPage(pageController.page!.toInt() + 1,
  //               duration: const Duration(milliseconds: 400),
  //               curve: Curves.easeIn);
  //         });
  //       },
  //     ),
  //     HomeON(
  //       title: "Tittle Two",
  //       subtitle: "Lorem ipsum dolor sit amet la maryame dor sut colondeum",
  //       imge: "assets/secondpage.png",
  //       index: 1,
  //       onTap: () {
  //         setState(() {
  //           setState(() {
  //             pageController.animateToPage(pageController.page!.toInt() + 1,
  //                 duration: const Duration(milliseconds: 400),
  //                 curve: Curves.easeIn);
  //           });
  //         });
  //       },
  //     ),
  //     HomeON(
  //       title: "Tittle Three",
  //       subtitle: "Lorem ipsum dolor sit amet la maryame dor sut colondeum",
  //       imge: "assets/thirdpage.png",
  //       index: 2,
  //       onTap: () {
  //         Get.to(const WebLogin());
  //       },
  //     )
  //   ];
  // }
}
