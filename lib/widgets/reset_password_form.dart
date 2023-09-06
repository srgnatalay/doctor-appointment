import 'package:appointment_app/services/auth_service.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey();
  final _passwordController = TextEditingController();

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Config.textFormField(
            _passwordController,
            TextInputType.text,
            "Yeni Parola",
            const Icon(
              FluentIcons.lock_closed_16_regular,
            ),
            true,
            true,
            () {},(p0) {
              
            },
          ),
          Config.spaceSmall,
          Config.textFormField(
            _passwordController,
            TextInputType.text,
            "Yeni Parola Onayla",
            const Icon(
              FluentIcons.lock_closed_16_regular,
            ),
            true,
            true,
            () {},(p0) {
              
            },
          ),
          Config.spaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () {
                  _auth
                      .passwordUpdate(_passwordController.text)
                      .then((value) => Navigator.pushNamed(context, "/"));
                },
                style: Config.outlinedButtonStyle(Config.buttonColor),
                child: Text(
                  "Onayla",
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
