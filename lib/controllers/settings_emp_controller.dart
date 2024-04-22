import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingsEmpController extends GetxController {
  @override
  void onInit() {
    getData = getUserData();
    super.onInit();
  }

  var isLoading = false.obs;
  var currentUser = FirebaseAuth.instance.currentUser;
  var empName = ''.obs;
  var empEmail = ''.obs;
  Future? getData;

  getUserData() async{
    isLoading(true);
    DocumentSnapshot<Map<String,dynamic>> user =
    await FirebaseFirestore.instance.collection('employees').doc(currentUser!.uid).get();
    var userData = user.data();
    empName.value = userData!['empName'] ?? "";
    empEmail.value = currentUser!.email ?? '';
    isLoading(false);
  }
}