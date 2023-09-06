// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appointment_app/services/date_time_converter.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:appointment_app/services/auth_service.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/utils/text.dart';
import 'package:appointment_app/widgets/button.dart';
import 'package:appointment_app/widgets/custom_appbar.dart';

class AppointmentPage extends StatefulWidget {
  final String? doctorName;
  final String? hospitalName;
  const AppointmentPage({
    Key? key,
    this.doctorName,
    this.hospitalName,
  }) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  late AuthService _authService;

  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;

  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: widget.doctorName,
      ),
      body: Container(
        decoration: Config.gradientBG(),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(
                    widget.hospitalName!,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  _tableCalender(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 25),
                    child: Text(
                      AppText.enText["choose_appointment"]!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            _isWeekend
                ? SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 30),
                      alignment: Alignment.center,
                      child: Text(
                        AppText.enText["choose_another_date"]!,
                        style: const TextStyle(
                            fontSize: 16, color: Config.colorBlack),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                              _timeSelected = true;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _currentIndex == index
                                    ? Config.iconColor
                                    : Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(15),
                              color: _currentIndex == index
                                  ? Config.iconColor
                                  : null,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "${index + 9}:00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _currentIndex == index
                                      ? Colors.white
                                      : null),
                            ),
                          ),
                        );
                      },
                      childCount: 8,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, childAspectRatio: 1.5),
                  ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
                child: SizedBox(
                  height: Config.heightSize * .07,
                  width: double.infinity,
                  child: Button(
                    width: double.infinity,
                    title: AppText.enText["make_appointment"]!,
                    disable: _timeSelected && _dateSelected ? false : true,
                    onPressed: () async {
                      final bookingDate = DateTimeConverter.getDate(
                        dateTime: _currentDay,
                      );
                      final bookingDay = DateTimeConverter.getDay(
                        day: _currentDay.weekday,
                      );
                      final bookingTime = DateTimeConverter.getTime(
                        index: _currentIndex!,
                      );

                      await _authService.addAppointment(
                          bookingDate,
                          bookingDay,
                          bookingTime,
                          widget.doctorName!,
                          widget.hospitalName!);

                      Navigator.pushNamed(context, "/success");
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tableCalender() {
    return TableCalendar(
      rowHeight: 42,
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2023, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      calendarStyle: const CalendarStyle(
        disabledTextStyle: TextStyle(color: Colors.black54),
        todayTextStyle: TextStyle(color: Colors.black),
        todayDecoration: BoxDecoration(
          color: Color.fromRGBO(255, 195, 195, 1),
          shape: BoxShape.circle,
        ),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: "Ay",
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      },
    );
  }
}
