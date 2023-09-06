import 'package:appointment_app/models/doctor_data.dart';
import 'package:appointment_app/models/doctor_model.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class AboutDoctor1 extends StatefulWidget {
  final String? name;
  final String? hospitalName;
  const AboutDoctor1({super.key, required this.name, this.hospitalName});

  @override
  State<AboutDoctor1> createState() => _AboutDoctor1State();
}

class _AboutDoctor1State extends State<AboutDoctor1> {
  List<DoctorModel> doctorDataList =
      doctorMapList.map((e) => DoctorModel.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          CircleAvatar(
            radius: 65,
            backgroundImage: AssetImage(doctorDataList[0].image!),
            backgroundColor: Colors.white,
          ),
          Config.spaceSmall,
          Text(
            widget.name!,
            style: const TextStyle(
                color: Color.fromRGBO(41, 41, 41, 1),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * .75,
            child: Text(
              widget.hospitalName!,
              style: const TextStyle(
                color: Color.fromRGBO(41, 41, 41, 1),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
