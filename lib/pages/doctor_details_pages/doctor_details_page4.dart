import 'package:appointment_app/models/doctor_data.dart';
import 'package:appointment_app/models/doctor_model.dart';
import 'package:appointment_app/pages/appointment_page.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/widgets/appointment_button.dart';
import 'package:appointment_app/widgets/custom_appbar.dart';
import 'package:appointment_app/widgets/doctor_details.body/doctor_details_body4.dart';
import 'package:appointment_app/widgets/doctor_details/doctor_details4.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class DoctorDetails4 extends StatefulWidget {
  const DoctorDetails4({super.key});

  @override
  State<DoctorDetails4> createState() => _DoctorDetails4State();
}

class _DoctorDetails4State extends State<DoctorDetails4> {
  List<DoctorModel> doctorDataList =
      doctorMapList.map((e) => DoctorModel.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    String? name = doctorDataList[3].name;
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
                AboutDoctor4(
                  name: name,
                  hospitalName: hospitalName,
                ),
                const DetailBody4(),
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
