import 'package:appointment_app/services/auth_service.dart';
import 'package:appointment_app/utils/text.dart';
import 'package:appointment_app/widgets/flushbar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../utils/config.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  late AuthService _authService;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppText.enText["reset_password"]!,
            style: Config.infoTextStyle(),
          ),
          Config.spaceSmall,
          Config.textFormField(
            _emailController,
            TextInputType.emailAddress,
            "hello@gmail.com",
            const Icon(FluentIcons.mail_16_regular),
            true,true,
            () {},(p0) {
              
            },
          ),
          Config.spaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () {
                  passwordResetMail();
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

  void passwordResetMail() async {
    var result =
        await _authService.passwordResetMail(_emailController.text.trim());

    if (result == "success") {
      flushBar(context,
          "Şifre değiştirme linki yollandı! Emailinizi kontrol ediniz", 3);
      Future.delayed(
        const Duration(seconds: 4),
        () => Navigator.pop(context),
      );
    } else {
      _formKey.currentState!.reset();
      flushBar(context, "Geçersiz Mail", 2);
    }
  }
}
