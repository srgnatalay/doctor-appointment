import 'package:appointment_app/services/auth_service.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/widgets/appointment_button.dart';
import 'package:appointment_app/widgets/flushbar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class PasswordChangeForm extends StatefulWidget {
  const PasswordChangeForm({super.key});

  @override
  State<PasswordChangeForm> createState() => _PasswordChangeFormState();
}

class _PasswordChangeFormState extends State<PasswordChangeForm> {
  late AuthService _authService;
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _passwordController1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
  }

  bool obscurePass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Yeni Parola",
            style: Config.titleTextStyle(),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscurePass,
            style: Config.formTextStyle(),
            decoration: InputDecoration(
              fillColor: Config.secondaryColor,
              filled: true,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscurePass = !obscurePass;
                  });
                },
                icon: obscurePass
                    ? const Icon(
                        FluentIcons.eye_off_16_regular,
                        color: Colors.black38,
                      )
                    : const Icon(FluentIcons.eye_16_regular,
                        color: Colors.black38),
              ),
            ),
            validator: (value) {
              if (value!.length < 6) {
                return "Şifre en az 6 haneli olmalı";
              } else {
                return null;
              }
            },
          ),
          Config.spaceSmall,
          Text(
            "Yeni Parola (Tekrar)",
            style: Config.titleTextStyle(),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passwordController1,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscurePass,
            style: Config.formTextStyle(),
            decoration: InputDecoration(
              fillColor: Config.secondaryColor,
              filled: true,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscurePass = !obscurePass;
                  });
                },
                icon: obscurePass
                    ? const Icon(
                        FluentIcons.eye_off_16_regular,
                        color: Colors.black38,
                      )
                    : const Icon(FluentIcons.eye_16_regular,
                        color: Colors.black38),
              ),
            ),
            validator: (value) {
              if (value!.length < 6) {
                return "Şifre en az 6 haneli olmalı";
              } else {
                return null;
              }
            },
          ),
          Config.spaceMedium,
          AppointmentButton(
            color: Config.buttonColor,
            icon: FluentIcons.save_16_regular,
            labelText: "Kaydet",
            onPressed: () {
              bool areEqual = areTextFieldsEqual();
              if (areEqual) {
                updatePassword();
                flushBar(context, "Şifre başarıyla değiştirildi", 3);
                Future.delayed(
                  const Duration(seconds: 3),
                  () => Navigator.pop(context),
                );
              } else {
                flushBar(context, "Şifre uyuşmuyor!", 2);
              }
            },
          ),
        ],
      ),
    );
  }

  void updatePassword() async {
    await _authService.passwordUpdate(_passwordController.text);
  }

  bool areTextFieldsEqual() {
    String text1 = _passwordController.text;
    String text2 = _passwordController1.text;

    return text1 == text2;
  }
}
