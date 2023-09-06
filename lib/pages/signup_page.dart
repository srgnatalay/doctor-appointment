import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/utils/text.dart';
import 'package:appointment_app/widgets/sign_up_form.dart.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            height: Config.containerHeight(context),
            width: Config.containerWidth(context),
            padding: Config.paddingAll20(),
            decoration: Config.decorationPopUp(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppText.enText["signUp_text"]!,
                        style: Config.popUpTitleTextStyle(),
                      ),
                      const CloseButton(),
                    ],
                  ),
                  Config.spaceSmall,
                  const RegisterForm(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
