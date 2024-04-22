import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttermyappp/res/components/waiting_screen.dart';
import 'package:fluttermyappp/views/appointment_view/appointment_view.dart';
import 'package:fluttermyappp/views/category_details_view/category_details_view.dart';
import 'package:fluttermyappp/views/category_view/category_view.dart';
import 'package:fluttermyappp/views/employees_profile_view/employees_profile_view.dart';
import 'package:fluttermyappp/views/home_view/home.dart';
import 'package:fluttermyappp/views/home_view/home_emp.dart';
import 'package:fluttermyappp/views/home_view/home_view.dart';
import 'package:fluttermyappp/views/login_view/login_view.dart';
import 'package:fluttermyappp/conts/conts.dart';
import 'package:fluttermyappp/views/settings_view/settings_view.dart';
import 'package:fluttermyappp/views/signup_view/signup_view.dart';
import 'package:fluttermyappp/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build (BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily:AppFonts.nunito),
      debugShowCheckedModeBanner: false,
      home: const WaitingScreen(),
    );
  }
}