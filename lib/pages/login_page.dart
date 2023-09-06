import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/utils/text.dart';
import 'package:appointment_app/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Config.gradientBG(),
        child: SingleChildScrollView(
          primary: true,
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3979,
                  child: const Center(child: Text("LOGO"))),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.width * 1.06,
                  padding: Config.paddingAll20(),
                  decoration: Config.decorationPopUp(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppText.enText["signIn_text"]!,
                          style: Config.popUpTitleTextStyle(),
                        ),
                        Config.spaceSmall,
                        const LoginForm(),
                        Config.spaceSmall,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
