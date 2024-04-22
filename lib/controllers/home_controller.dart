import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:fluttermyappp/conts/conts.dart';

class HomeController extends GetxController {
  var searchQueryController = TextEditingController();
  var isLoading = false.obs;

  Future<QuerySnapshot<Map<String, dynamic>>> getEmployeesList() async{
    var employees = await FirebaseFirestore.instance.collection('employees').get();
    return employees;
  }

}