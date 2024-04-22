import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttermyappp/views/appointment_view/appointment_view.dart';
import 'package:fluttermyappp/views/home_view/home.dart';
import 'package:fluttermyappp/views/home_view/home_emp.dart';
import 'package:fluttermyappp/views/login_view/login_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var aboutController = TextEditingController();
  var addressController = TextEditingController();
  var servicesController = TextEditingController();
  var timingController = TextEditingController();
  var phoneController = TextEditingController();
  var categoryController = TextEditingController();

  UserCredential? userCredential;


  isUserAlreadyLoggedIn() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        var data = await FirebaseFirestore.instance.collection('employees').doc(
            user.uid).get();
        var isEmp = data.data()?.containsKey('empName') ?? false;

        if (isEmp) {
          Get.offAll(() => const HomeEmp());
        } else {
          Get.offAll(() => const Home());
        }
      } else {
        Get.offAll(() => const LoginView());
      }
    });
  }

  loginUser(bool isEmpl) async {
    userCredential = await FirebaseAuth.instance.
    signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    if (userCredential != null) {
      if (isEmpl) {
        Get.to(() => const HomeEmp());
      } else {
        Get.to(() => const Home());
      }
    }
  }

  signupUser(bool isEmployees) async {
    userCredential = await FirebaseAuth.instance.
    createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    await storeUserData(userCredential!.user!.uid, fullnameController.text,
        emailController.text, isEmployees);
  }

  storeUserData(String uid, String fullname, String email,
      bool isEmployees) async {
    var store = FirebaseFirestore.instance.collection(
        isEmployees ? 'employees' : 'users').doc(uid);
    if (isEmployees) {
      await store.set({
        'empAbout': aboutController.text,
        'empAddress': addressController.text,
        'empCategory': categoryController.text,
        'empName': fullname,
        'empPhone': phoneController.text,
        'empService': servicesController.text,
        'empTiming': timingController.text,
        'empID': FirebaseAuth.instance.currentUser?.uid,
        'empRating': 1,
        'empEmail': email,
      });
    } else {
      await store.set({'fullname': fullname, 'email': email});
    }
  }

  signout() async{
    await FirebaseAuth.instance.signOut();
  }
}