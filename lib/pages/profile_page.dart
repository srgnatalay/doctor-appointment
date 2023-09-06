import 'package:appointment_app/services/auth_service.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/utils/text.dart';
import 'package:appointment_app/widgets/profile_settings_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AuthService _authService;
  final _firestoreCol = FirebaseFirestore.instance.collection("user");

  final _userUID = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
  }

  @override
  Widget build(BuildContext context) {
    final stream = _firestoreCol.doc(_userUID).snapshots();
    return Scaffold(
      body: Container(
        decoration: Config.gradientBG(),
        child: Padding(
          padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppText.enText["profile_text"]!,
                textAlign: TextAlign.center,
                style: Config.titleTextStyle(),
              ),
              Config.spaceSmall,
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final userData = snapshot.data?.data();
                    return Text(
                      "${userData!["name"]}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              Config.spaceMedium,
              ProfileSettings(
                onTap: () => Navigator.pushNamed(context, "/id_info"),
                text: AppText.enText["id_info_text"]!,
                icon: FluentIcons.person_16_regular,
                color: const Color.fromRGBO(217, 217, 217, 1),
              ),
              ProfileSettings(
                onTap: () => Navigator.pushNamed(context, "/password_change"),
                text: AppText.enText["password_text"]!,
                icon: FluentIcons.lock_closed_16_regular,
                color: const Color.fromRGBO(217, 217, 217, 1),
              ),
              ProfileSettings(
                onTap: () {
                  _authService.signOut();
                  Navigator.pushNamed(context, "/");
                },
                text: AppText.enText["sign_out_text"]!,
                icon: FluentIcons.sign_out_20_regular,
                color: const Color.fromRGBO(217, 217, 217, 1),
              ),
              ProfileSettings(
                onTap: () {
                  _authService.deleteUser();
                },
                text: "Hesabımı Sil",
                icon: FluentIcons.delete_16_regular,
                color: Colors.red.shade300,
              )
            ],
          ),
        ),
      ),
    );
  }
}
