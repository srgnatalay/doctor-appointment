import 'package:appointment_app/models/doctor_data.dart';
import 'package:appointment_app/models/doctor_model.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class AboutDoctor4 extends StatefulWidget {
  final String? name;
  final String? hospitalName;
  const AboutDoctor4({super.key, this.name, this.hospitalName});

  @override
  State<AboutDoctor4> createState() => _AboutDoctor4State();
}

class _AboutDoctor4State extends State<AboutDoctor4> {
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
            backgroundImage: AssetImage(doctorDataList[3].image!),
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
