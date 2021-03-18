import 'package:flutter/material.dart';
import 'package:projet/models/ShieldIcon.dart';

class Shield {
  static List<Shield> shields = [
    Shield("001"),
    Shield("002"),
    Shield("003"),
    Shield("004"),
    Shield("005"),
  ];
  String uuid;
  ShieldIcon icon;
  Color color;

  Shield(String uuid, {Color color = Colors.black, ShieldIcon icon}) {
    this.icon = null;
    this.color = color;
    this.uuid = uuid;
  }

  String getUrl() {
    return "assets/shields/shield-" + this.uuid + ".png";
  }
}
