import 'package:flutter/material.dart';
import 'package:projet/MyApp.dart';
import 'package:projet/models/Character.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Character.loadCaharacters();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}
