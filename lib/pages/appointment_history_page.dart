import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/utils/text.dart';
import 'package:flutter/material.dart';

import '../widgets/appointment_card.dart';

class AppointmentHistoryPage extends StatefulWidget {
  const AppointmentHistoryPage({super.key});

  @override
  State<AppointmentHistoryPage> createState() => _AppointmentHistoryPageState();
}

// ignore: constant_identifier_names
enum FilterStatus { Yaklasan, Tamamlanan, Iptal }

class _AppointmentHistoryPageState extends State<AppointmentHistoryPage> {
  FilterStatus status = FilterStatus.Yaklasan;
  Alignment _alignment = Alignment.centerLeft;
  List schedules = [
    {
      "doctor_name": "Atalay",
      "doctor_profile": "assets/images/backg.png",
      "category": "Dermatoloji",
      "status": FilterStatus.Yaklasan,
    },
    {
      "doctor_name": "Atalay",
      "doctor_profile": "assets/images/backg.png",
      "category": "Dermatoloji",
      "status": FilterStatus.Tamamlanan,
    },
    {
      "doctor_name": "Atalay",
      "doctor_profile": "assets/images/backg.png",
      "category": "Dermatoloji",
      "status": FilterStatus.Tamamlanan,
    },
    {
      "doctor_name": "Atalay",
      "doctor_profile": "assets/images/backg.png",
      "category": "Dermatoloji",
      "status": FilterStatus.Tamamlanan,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List filteredSchedules = schedules.where((schedule) {
      // switch (schedule["status"]) {
      //   case "upcoming":
      //     schedule["status"] = FilterStatus.yaklasan;
      //     break;
      //   case "complete":
      //     schedule["status"] = FilterStatus.complete;
      //     break;
      //   case "cancel":
      //     schedule["status"] = FilterStatus.complete;
      // }
      return schedule["status"] == status;
    }).toList();
    return Stack(
      children: [
        const Scaffold(
          backgroundColor: Colors.white,
        ),
        Container(
          decoration: Config.gradientBG(),
          child: Padding(
            padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                   AppText.enText["appointment"]!,
                  textAlign: TextAlign.center,
                  style: Config.titleTextStyle(),
                ),
                Config.spaceSmall,
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Config.secondaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (FilterStatus filterStatus in FilterStatus.values)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (filterStatus == FilterStatus.Yaklasan) {
                                      status = FilterStatus.Yaklasan;
                                      _alignment = Alignment.centerLeft;
                                    } else if (filterStatus ==
                                        FilterStatus.Tamamlanan) {
                                      status = FilterStatus.Tamamlanan;
                                      _alignment = Alignment.center;
                                    } else if (filterStatus ==
                                        FilterStatus.Iptal) {
                                      status = FilterStatus.Iptal;
                                      _alignment = Alignment.centerRight;
                                    }
                                  });
                                },
                                child: Center(
                                  child: Text(filterStatus.name),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    AnimatedAlign(
                      alignment: _alignment,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Config.iconColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            status.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Config.spaceSmall,
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredSchedules.length,
                    itemBuilder: (context, index) {
                      var schedule = filteredSchedules[index];
                      bool isLastElement =
                          filteredSchedules.length + 1 == index;
                      return Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: !isLastElement
                            ? const EdgeInsets.only(bottom: 20)
                            : EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage(schedule["doctor_profile"]),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        schedule["doctor_name"],
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        schedule["category"],
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Config.spaceSmall,
                              const DateCard(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
