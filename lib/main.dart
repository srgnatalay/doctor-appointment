import 'package:appointment_app/firebase_options.dart';
import 'package:appointment_app/main_layout.dart';
import 'package:appointment_app/pages/doctor_details_pages/doctor_details_page1.dart';
import 'package:appointment_app/pages/doctor_details_pages/doctor_details_page2.dart';
import 'package:appointment_app/pages/doctor_details_pages/doctor_details_page3.dart';
import 'package:appointment_app/pages/doctor_details_pages/doctor_details_page4.dart';
import 'package:appointment_app/pages/id_info_page.dart';
import 'package:appointment_app/pages/login_page.dart';
import 'package:appointment_app/pages/otp_page.dart';
import 'package:appointment_app/pages/password_change_page.dart';
import 'package:appointment_app/pages/signup_page.dart';
import 'package:appointment_app/pages/reset_password_page.dart';
import 'package:appointment_app/pages/success_page.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: "Appointment App",
      debugShowCheckedModeBanner: false,
      theme: Config.themeData(),
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        "/main": (context) => const MainLayout(),
        "/register": (context) => const RegisterPage(),
        "/otp": (context) => const EnterOTPPage(),
        "/reset_password": (context) => const ResetPasswordPage(),
        "/doctor_details1": (context) => const DoctorDetails1(),
        "/doctor_details2": (context) => const DoctorDetails2(),
        "/doctor_details3": (context) => const DoctorDetails3(),
        "/doctor_details4": (context) => const DoctorDetails4(),
        "/success": (context) => const AppointmentSuccess(),
        "/id_info": (context) => const IDInfoPage(),
        "/password_change": (context) => const PasswordChangePage()
      },
    );
  }
}
