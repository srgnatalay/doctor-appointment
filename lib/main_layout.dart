import 'package:appointment_app/pages/appointment_history_page.dart';
import 'package:appointment_app/pages/home_page.dart';
import 'package:appointment_app/pages/profile_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPage = 0;
  final PageController _page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _page,
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
          children: const <Widget>[
            HomePage(),
            AppointmentHistoryPage(),
            ProfilePage()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 193, 228, 245),
        iconSize: MediaQuery.of(context).size.height * 0.04,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: currentPage,
        onTap: (page) {
          setState(() {
            currentPage = page;
            _page.jumpToPage(page);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              FluentIcons.home_16_regular,
              color: Color.fromRGBO(169, 169, 169, 1),
            ),
            activeIcon: Icon(
              FluentIcons.home_16_filled,
              color: Color.fromRGBO(41, 41, 41, 1),
            ),
            label: "Ana Sayfa",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FluentIcons.calendar_16_regular,
              color: Color.fromRGBO(169, 169, 169, 1),
            ),
            activeIcon: Icon(
              FluentIcons.calendar_16_filled,
              color: Color.fromRGBO(41, 41, 41, 1),
            ),
            label: "Randevu",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FluentIcons.person_16_regular,
              color: Color.fromRGBO(169, 169, 169, 1),
            ),
            activeIcon: Icon(
              FluentIcons.person_16_filled,
              color: Color.fromRGBO(41, 41, 41, 1),
            ),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}
