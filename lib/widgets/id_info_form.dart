import 'package:appointment_app/utils/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IDInfoForm extends StatefulWidget {
  const IDInfoForm({super.key});

  @override
  State<IDInfoForm> createState() => _IDInfoFormState();
}

class _IDInfoFormState extends State<IDInfoForm> {
  final _firestoreCol = FirebaseFirestore.instance.collection("user");
  final _userUID = FirebaseAuth.instance.currentUser!.uid;
  // late AuthService _authService;

  // final _nameController = TextEditingController();
  // final _phoneNumberController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   _authService = AuthService();
  // }

  @override
  Widget build(BuildContext context) {
    final stream = _firestoreCol.doc(_userUID).snapshots();

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder(
            stream: stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userData = snapshot.data!.data();
                return Config.infoTextFormField(TextInputType.name, "Ad Soyad",
                    "${userData!["name"]}", true);
              }
              return const CircularProgressIndicator();
            },
          ),
          Config.spaceSmall,
          StreamBuilder(
            stream: stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userData = snapshot.data!.data();
                return Config.infoTextFormField(TextInputType.name, "Cinsiyet",
                    "${userData!["gender"]}", false);
              }
              return const CircularProgressIndicator();
            },
          ),
          Config.spaceSmall,
          StreamBuilder(
            stream: stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userData = snapshot.data!.data();

                return Config.infoTextFormField(
                  TextInputType.number,
                  "Telefon Numarası",
                  "${userData!["phoneNumber"]}",
                  true,
                );
              }
              return const CircularProgressIndicator();
            },
          ),
          Config.spaceSmall,
          // AppointmentButton(
          //   color: Config.buttonColor,
          //   icon: FluentIcons.save_16_regular,
          //   labelText: "Kaydet",
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }

  // void updateUserName() async {
  //   await _authService.userNameUpdate(_nameController.text);
  // }

  // void updatePhoneNumber() async {
  //   await _authService.phoneNumberUpdate(_phoneNumberController.text);
  // }
}
