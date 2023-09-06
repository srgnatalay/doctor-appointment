import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/utils/text.dart';
import 'package:flutter/material.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({super.key});

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  final _formKey = GlobalKey<FormState>();
  final _otpController1 = TextEditingController();
  final _otpController2 = TextEditingController();
  final _otpController3 = TextEditingController();
  final _otpController4 = TextEditingController();
  final _otpController5 = TextEditingController();
  final _otpController6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppText.enText["otp_text"]!,
            style: Config.infoTextStyle(),
          ),
          Config.spaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Config.otpTextFormField(context, _otpController1),
              Config.otpTextFormField(context, _otpController2),
              Config.otpTextFormField(context, _otpController3),
              Config.otpTextFormField(context, _otpController4),
              Config.otpTextFormField(context, _otpController5),
              Config.otpTextFormField(context, _otpController6),
            ],
          ),
          Config.spaceSmall,
          Text(
            "Kodu tekrar gönder 23 sn",
            style: Config.infoTextStyle(),
          ),
          Config.spaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/reset_password");
                },
                style: Config.outlinedButtonStyle(Config.buttonColor),
                child: Text(
                  "Gönder",
                  style: Config.submitButtonTextStyle(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
