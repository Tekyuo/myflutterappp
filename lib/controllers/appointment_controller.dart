import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttermyappp/conts/conts.dart';

class AppointmentController extends GetxController{
  var isLoading = false.obs;

  var appDayController = TextEditingController();
  var appTimeController = TextEditingController();
  var appMobileController = TextEditingController();
  var appNameController = TextEditingController();
  var appMessageController = TextEditingController();

  bookAppointment(String empID, String empName, context) async{
    isLoading(true);

    var store = FirebaseFirestore.instance.collection('appointments').doc();
    await store.set({

      'appBy': FirebaseAuth.instance.currentUser?.uid,
      'appDay': appDayController.text,
      'appTime': appTimeController.text,
      'appMobile': appMobileController.text,
      'appName': appNameController.text,
      'appMsg': appMessageController.text,
      'appWith': empID,
      'appWithName': empName,
    });
   isLoading(false);
   VxToast.show(context, msg: "Appointment is booked successfully!");
   Get.back();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAppointments(bool isEmployees) {
    if(isEmployees){
      return FirebaseFirestore.instance
          .collection('appointments')
          .where('appWith', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
    }else{
      return FirebaseFirestore.instance
          .collection('appointments')
          .where('appBy', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
    }
  }
  Future<QuerySnapshot<Map<String, dynamic>>> getEmployeesList() async{
    var employees = await FirebaseFirestore.instance.collection('employees').get();
    return employees;
  }

}