import 'package:flutter/material.dart';

class ShieldIcon {
  static List<ShieldIcon> icons = [
    ShieldIcon("001"),
    ShieldIcon("002"),
    ShieldIcon("003"),
    ShieldIcon("004"),
    ShieldIcon("005"),
    ShieldIcon("006"),
    ShieldIcon("007"),
    ShieldIcon("008"),
    ShieldIcon("009"),
    ShieldIcon("010"),
    ShieldIcon("011"),
    ShieldIcon("012"),
    ShieldIcon("013"),
    ShieldIcon("014"),
    ShieldIcon("015"),
    ShieldIcon("001"),
    ShieldIcon("016"),
    ShieldIcon("017"),
    ShieldIcon("018"),
    ShieldIcon("019"),
    ShieldIcon("020"),
  ];
  String uuid;
  Color color;

  ShieldIcon(String uuid, {Color color = Colors.white}) {
    this.uuid = uuid;
    this.color = color;
  }

  String getUrl() {
    return "assets/shieldicons/shield-icon-" + this.uuid + ".png";
  }
}
