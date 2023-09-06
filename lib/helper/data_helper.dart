import 'package:flutter/material.dart';

class DataHelper {
  static List<String> _hospitals() {
    return ["İzmir", "Ankara bdhbj dbsahb j bhdasj", "İstanbul"];
  }

  static List<String> _policlinics() {
    return ["üroloji", "Ankara", "İstanbul"];
  }

  static List<String> _doctors() {
    return ["Doktor1", "Doktor2", "Doktor3"];
  }

  static List<DropdownMenuItem<String>> hospitals() {
    return _hospitals()
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Center(child: Text(e)),
          ),
        )
        .toList();
  }

  static List<DropdownMenuItem<String>> policlinics() {
    return _policlinics()
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Center(child: Text(e)),
          ),
        )
        .toList();
  }

  static List<DropdownMenuItem<String>> doctors() {
    return _doctors()
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Center(child: Text(e)),
          ),
        )
        .toList();
  }
}
