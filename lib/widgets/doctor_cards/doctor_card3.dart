import 'package:appointment_app/models/doctor_data.dart';
import 'package:appointment_app/models/doctor_model.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class DoctorCard3 extends StatefulWidget {
  const DoctorCard3({super.key});

  @override
  State<DoctorCard3> createState() => _DoctorCard3State();
}

class _DoctorCard3State extends State<DoctorCard3> {
  List<DoctorModel> doctorDataList =
      doctorMapList.map((e) => DoctorModel.fromJson(e)).toList();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Config.paddingSymetric(),
      height: 150,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/doctor_details3");
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          color: const Color.fromRGBO(241, 241, 241, 1),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
              child: SizedBox(
                width: Config.widthSize * 0.3,
                child: Image.asset(
                  doctorDataList[2].image!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: Config.paddingSymetric(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Config.spaceSmall,
                        Text(
                          doctorDataList[2].name!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 50,
              height: 122,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.grey,
              ),
              child: const Icon(
                FluentIcons.ios_arrow_24_regular,
                size: 30,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}