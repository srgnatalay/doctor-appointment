import 'package:appointment_app/utils/text.dart';
import 'package:flutter/material.dart';

import '../utils/config.dart';
import '../widgets/forgot_password_form.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width,
            padding: Config.paddingAll20(),
            decoration: Config.decorationPopUp(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppText.enText["forgot_password"]!,
                        style: Config.popUpTitleTextStyle(),
                      ),
                      const CloseButton(),
                    ],
                  ),
                  Config.spaceMedium,
                  const ForgotPasswordForm(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
