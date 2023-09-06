import 'package:appointment_app/utils/config.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  State<AppointmentCard> createState() => AppointmentCardState();
}

class AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(82, 82, 82, 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 8, offset: Offset(4, 5))
          ]),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/backg.png"),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Doktor adı",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Dermatoloji",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(204, 204, 204, 1)),
                      ),
                    ],
                  )
                ],
              ),
              Config.spaceSmall,
              const DateCard(),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        "İptal Et",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateCard extends StatelessWidget {
  const DateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FluentIcons.calendar_16_regular,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Gün, Tarih",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            FluentIcons.clock_16_regular,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              "10.35",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
