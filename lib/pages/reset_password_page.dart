import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/utils/text.dart';
import 'package:appointment_app/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        primary: true,
        child: Column(children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.3979,
              child: const Center(child: Text("LOGO"))),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              height: Config.containerWidth(context) * 1,
              padding: Config.paddingAll20(),
              decoration: Config.decorationPopUp(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppText.enText["reset_password_text"]!,
                    style: Config.popUpTitleTextStyle(),
                  ),
                  Config.spaceMedium,
                  const ResetPasswordForm(),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
