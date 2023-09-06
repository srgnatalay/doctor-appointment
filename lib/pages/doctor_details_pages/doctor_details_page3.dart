import 'package:appointment_app/models/doctor_data.dart';
import 'package:appointment_app/models/doctor_model.dart';
import 'package:appointment_app/pages/appointment_page.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/widgets/appointment_button.dart';
import 'package:appointment_app/widgets/custom_appbar.dart';
import 'package:appointment_app/widgets/doctor_details.body/doctor_details_body3.dart';
import 'package:appointment_app/widgets/doctor_details/doctor_details3.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class DoctorDetails3 extends StatefulWidget {
  const DoctorDetails3({super.key});

  @override
  State<DoctorDetails3> createState() => _DoctorDetails3State();
}

class _DoctorDetails3State extends State<DoctorDetails3> {
  List<DoctorModel> doctorDataList =
      doctorMapList.map((e) => DoctorModel.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    String? name = doctorDataList[2].name;
    String? hospitalName = doctorDataList[3].hospitalName;
    return Scaffold(
      appBar: const CustomAppBar(
        appTitle: "Doktor Bilgileri",
      ),
      body: Container(
        decoration: Config.gradientBG(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AboutDoctor3(
                  name: name,
                  hospitalName: hospitalName,
                ),
                const DetailBody3(),
                AppointmentButton(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  icon: FluentIcons.calendar_16_regular,
                  labelText: "Randevu Al",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppointmentPage(
                                  doctorName: name,
                                  hospitalName: hospitalName,
                                )));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
