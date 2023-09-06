import 'package:appointment_app/models/doctor_data.dart';
import 'package:appointment_app/models/doctor_model.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class DetailBody1 extends StatefulWidget {
  const DetailBody1({super.key});

  @override
  State<DetailBody1> createState() => _DetailBody1State();
}

class _DetailBody1State extends State<DetailBody1> {
  List<DoctorModel> doctorDataList =
      doctorMapList.map((e) => DoctorModel.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Config.paddingAll20(),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DoctorInfo(),
          Config.spaceSmall,
          const Text(
            "Doktor Hakkında",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Config.spaceSmall,
          Text(
            doctorDataList[0].description!,
            style: const TextStyle(fontWeight: FontWeight.w500, height: 1.5),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}

class DoctorInfo extends StatefulWidget {
  const DoctorInfo({super.key});

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  List<DoctorModel> doctorDataList =
      doctorMapList.map((e) => DoctorModel.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InfoCard(
            label: "Deneyim", value: "${doctorDataList[0].experience!} yıl"),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const InfoCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Config.widthSize * .4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(217, 217, 217, 1),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color.fromRGBO(41, 41, 41, 1),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color.fromRGBO(41, 41, 41, 1),
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
