// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:appointment_app/utils/config.dart';

class ProfileSettings extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final IconData? icon;
  final Color color;

  const ProfileSettings({
    Key? key,
    required this.onTap,
    required this.text,
    this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Config.paddingSymetric(),
      height: 70,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          color: color,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 30,
                ),
                Text(
                  text,
                  style: Config.titleTextStyle(),
                ),
                const SizedBox(width: 45),
                const Icon(FluentIcons.ios_arrow_24_regular)
              ]),
        ),
      ),
    );
  }
}
