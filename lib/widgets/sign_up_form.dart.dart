// ignore_for_file: use_build_context_synchronously

import 'package:appointment_app/services/auth_service.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/widgets/flushbar.dart';
import 'package:appointment_app/widgets/terms_policies.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  late AuthService _authService;

  bool obscurePass = true;
  String? currentGender = "erkek";

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
        children: [
          TextFormField(
            autofocus: true,
            style: Config.formTextStyle(),
            controller: _nameController,
            keyboardType: TextInputType.name,
            cursorColor: Config.colorBlack,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Config.secondaryColor,
              hintText: "Ad ve Soyad",
              alignLabelWithHint: true,
              prefixIcon: Icon(FluentIcons.person_16_regular),
              prefixIconColor: Config.iconColor,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Ad ve soyad boş olamaz";
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              _nameController.text = newValue!;
            },
          ),
          Config.spaceSmall,
          DecoratedBox(
            decoration: BoxDecoration(
                color: Config.secondaryColor,
                border: Border.all(color: Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: DropdownButton(
                itemHeight: 60,
                underline: Container(),
                alignment: Alignment.center,
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: "erkek",
                    child: Text("Erkek"),
                  ),
                  DropdownMenuItem(
                    value: "kadın",
                    child: Text("Kadın"),
                  ),
                ],
                value: currentGender,
                onChanged: (value) {
                  setState(() {
                    currentGender = value;
                  });
                },
              ),
            ),
          ),
          Config.spaceSmall,
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
                return "Email boş kalamaz";
              } else if (!EmailValidator.validate(value)) {
                return "Geçerli mail adresi giriniz";
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              _emailController.text = newValue!;
            },
          ),
          Config.spaceSmall,
          TextFormField(
            maxLength: 10,
            style: Config.formTextStyle(),
            controller: _phoneNumberController,
            keyboardType: TextInputType.number,
            cursorColor: Config.colorBlack,
            decoration: const InputDecoration(
              counterText: "",
              filled: true,
              fillColor: Config.secondaryColor,
              hintText: "5xxxxxxxxx",
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.phone),
              prefixIconColor: Config.iconColor,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Telefon numarası boş olamaz";
              } else if (value.length < 10) {
                return "Geçerli telefon numarası giriniz";
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              _phoneNumberController.text = newValue!;
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
                        color: Colors.black38,
                      )
                    : const Icon(
                        FluentIcons.eye_16_regular,
                        color: Config.primaryColor,
                      ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Parola boş olamaz";
              } else if (value.length < 6) {
                return "Parola en az 6 haneli olmalı";
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              _passwordController.text = newValue!;
            },
          ),
          Config.spaceSmall,
          const TermsAndPoliciesText(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "okudum anladım.",
                style: Config.infoTextStyle(),
              ),
            ),
          ),
          Config.spaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    flushBar(
                        context,
                        "Kayıt yapıldı, giriş sayfasına yönlendiriliyorsunuz..",
                        3);
                    createUser();
                  } else {}
                },
                style: Config.outlinedButtonStyle(Colors.blueAccent),
                child: const Text(
                  "Hesap Oluştur",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void createUser() async {
    var result = await _authService.signUp(
        _nameController.text,
        _emailController.text,
        _phoneNumberController.text,
        _passwordController.text,
        currentGender!);

    if (result == "success") {
      Navigator.pop(context);
    } else {
      _formKey.currentState!.reset();
      flushBar(context, result!, 2);
    }
  }
}
