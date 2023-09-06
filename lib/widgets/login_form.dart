// ignore_for_file: use_build_context_synchronously

import 'package:appointment_app/pages/signup_page.dart';
import 'package:appointment_app/pages/forgot_password_page.dart';
import 'package:appointment_app/services/auth_service.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/utils/text.dart';
import 'package:appointment_app/widgets/flushbar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obscurePass = true;

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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            style: Config.formTextStyle(),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.colorBlack,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Config.secondaryColor,
              hintText: "hello@gmail.com",
              alignLabelWithHint: true,
              prefixIcon: Icon(FluentIcons.mail_16_regular),
              prefixIconColor: Config.iconColor,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Email boş olamaz";
              } else {
                return null;
              }
            },
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.colorBlack,
            obscureText: obscurePass,
            decoration: InputDecoration(
              filled: true,
              fillColor: Config.secondaryColor,
              hintText: "Şifre",
              alignLabelWithHint: true,
              prefixIcon: const Icon(FluentIcons.lock_closed_16_regular),
              prefixIconColor: Config.iconColor,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscurePass = !obscurePass;
                  });
                },
                icon: obscurePass
                    ? const Icon(
                        FluentIcons.eye_off_16_regular,
                        color: Config.colorBlack,
                      )
                    : const Icon(
                        FluentIcons.eye_16_regular,
                        color: Config.iconColor,
                      ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Şifre boş olamaz";
              } else {
                return null;
              }
            },
          ),
          Config.spaceSmall,
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: OutlinedButton(
                  onPressed: () {
                    Config.bottomSheet(
                        context,
                        MediaQuery.of(context).size.height * .965,
                        const RegisterPage());
                  },
                  style: Config.outlinedButtonStyle(Colors.red),
                  child: const Text(
                    "Kayıt Ol",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: OutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      flushBar(context, "Giriş Yapılıyor", 2);
                      signIn();
                    }
                  },
                  style: Config.outlinedButtonStyle(Colors.blueAccent),
                  child: const Text(
                    "Giriş Yap",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Config.bottomSheet(
                    context,
                    MediaQuery.of(context).size.width * 1.05,
                    const ForgotPasswordPage());
              },
              child: Text(
                AppText.enText["forgot_password"]!,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future signIn() async {
    var result = await _authService.signIn(
        _emailController.text, _passwordController.text);
    if (result == "success") {
      Navigator.pushNamed(context, "/main");
    } else {
      _formKey.currentState!.reset();
      flushBar(context, result!, 2);
    }
  }
}
