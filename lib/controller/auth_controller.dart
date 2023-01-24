import 'package:foodsapp/modules/home/home_screen.dart';
import 'package:foodsapp/modules/login/web_login.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Stream<User?> streamAuthStatus() {
  //   return auth.authStateChanges();
  // }

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.to(const HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print("No usr found for that email.");
      } else if (e.code == 'wrong-password') {
        // ignore: avoid_print
        print("Wrong password provided for that user");
      }
    }
  }

  void signup(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.to(const HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print("The password provider is too weak.");
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print("The account already exists for that email.");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.to(const WebLogin());
  }
}
