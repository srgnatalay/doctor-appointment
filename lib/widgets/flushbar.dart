import 'package:another_flushbar/flushbar.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

dynamic flushBar(BuildContext context, String text, int duration) {
  return Flushbar(
    backgroundGradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.center,
      colors: [
        Color.fromARGB(255, 116, 193, 230),
        Color.fromARGB(255, 57, 106, 129)
      ],
    ),
    padding: const EdgeInsets.all(20),
    backgroundColor: Colors.black.withOpacity(.7),
    icon: const Icon(
      FluentIcons.error_circle_16_regular,
      size: 30,
    ),
    duration: Duration(seconds: duration),
    flushbarPosition: FlushbarPosition.TOP,
    borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    messageSize: 18,
    messageText: Text(
      text,
      textAlign: TextAlign.start,
      style: Config.otpTextStyle(),
    ),
  ).show(context);
}
