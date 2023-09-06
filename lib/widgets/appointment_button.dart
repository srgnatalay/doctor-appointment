import 'package:flutter/material.dart';

import 'package:appointment_app/utils/config.dart';

class AppointmentButton extends StatelessWidget {
  final Color color;
  final IconData? icon;
  final String labelText;
  final void Function()? onPressed;
  const AppointmentButton({
    Key? key,
    required this.color,
    this.icon,
    required this.labelText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SizedBox(
        height: Config.heightSize * .07,
        width: double.infinity,
        child: ElevatedButton.icon(
          icon: Icon(
            icon,
            color: const Color.fromRGBO(41, 41, 41, 1),
            size: 26,
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 0,
              backgroundColor: color),
          label: Text(
            labelText,
            style: const TextStyle(
                color: Color.fromRGBO(41, 41, 41, 1),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
