import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/widgets/custom_appbar.dart';
import 'package:appointment_app/widgets/password_change_form.dart';
import 'package:flutter/material.dart';

class PasswordChangePage extends StatefulWidget {
  const PasswordChangePage({super.key});

  @override
  State<PasswordChangePage> createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appTitle: "Parola Değiştir"),
      body: Container(
        height: Config.screenHeight,
        width: Config.screenWidth,
        decoration: Config.gradientBG(),
        child: const Padding(
          padding: EdgeInsets.only(top: 45, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PasswordChangeForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
