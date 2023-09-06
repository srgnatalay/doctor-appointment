import 'package:appointment_app/models/doctor_data.dart';
import 'package:appointment_app/models/doctor_model.dart';
import 'package:appointment_app/pages/search_doctor.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/widgets/appointment_card.dart';
import 'package:appointment_app/widgets/doctor_cards/doctor_card4.dart';
import 'package:appointment_app/widgets/doctor_cards/doctor_card1.dart';
import 'package:appointment_app/widgets/doctor_cards/doctor_card2.dart';
import 'package:appointment_app/widgets/doctor_cards/doctor_card3.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  final _firestoreCol = FirebaseFirestore.instance.collection("user");
  final _userUID = FirebaseAuth.instance.currentUser!.uid;

  List<DoctorModel> doctorDataList =
      doctorMapList.map((e) => DoctorModel.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    final stream = _firestoreCol.doc(_userUID).snapshots();
    return Scaffold(
      body: Container(
        decoration: Config.gradientBG(),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: StreamBuilder(
                          stream: stream,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final userData = snapshot.data!.data();
                              return Text(
                                "${userData!["name"]},\nHoş Geldin",
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(41, 41, 41, 1),
                                ),
                              );
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/images/backg.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Config.spaceMedium,
                  Config.textFormField(
                    _searchController,
                    TextInputType.none,
                    "Doktor Ara",
                    const Icon(FluentIcons.search_16_regular),
                    false,
                    true,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchDoctor(),
                        ),
                      );
                    }, (p0) {
                      
                    },
                  ),
                  Config.spaceSmall,
                  const Text(
                    "Randevular",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(41, 41, 41, 1)),
                  ),
                  Config.spaceSmall,
                  Column(
                    children: List.generate(
                        3,
                        (index) => const Padding(
                              padding: EdgeInsets.only(bottom: 30),
                              child: AppointmentCard(),
                            )),
                  ),
                  const Text(
                    "Doktorlar",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(41, 41, 41, 1)),
                  ),
                  Config.spaceSmall,
                  const Column(
                    children: [
                      DoctorCard1(),
                      SizedBox(height: 8),
                      DoctorCard2(),
                      SizedBox(height: 8),
                      DoctorCard3(),
                      SizedBox(height: 8),
                      DoctorCard4()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
