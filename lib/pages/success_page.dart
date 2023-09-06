import 'dart:async';
import 'package:appointment_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppointmentSuccess extends StatefulWidget {
  const AppointmentSuccess({super.key});

  @override
  State<AppointmentSuccess> createState() => _AppointmentSuccessState();
}

class _AppointmentSuccessState extends State<AppointmentSuccess> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, "/main");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Config.gradientBG(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Lottie.asset(
                  "assets/images/success.json",
                  repeat: false,
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "Randevu Başarıyla Alındı",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
