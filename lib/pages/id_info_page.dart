import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/widgets/custom_appbar.dart';
import 'package:appointment_app/widgets/id_info_form.dart';
import 'package:flutter/material.dart';

class IDInfoPage extends StatefulWidget {
  const IDInfoPage({super.key});

  @override
  State<IDInfoPage> createState() => _IDInfoPageState();
}

class _IDInfoPageState extends State<IDInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appTitle: "Kullanıcı Bilgileri"),
      body: Container(
        height: Config.screenHeight,
        width: Config.screenWidth,
        decoration: Config.gradientBG(),
        child: const Padding(
          padding: EdgeInsets.only(top: 45, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IDInfoForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
