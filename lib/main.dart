import 'package:flutter/material.dart';
import 'package:projet/TheBattleApp.dart';
import 'package:projet/models/Character.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Character.loadCaharacters();
  runApp(TheBattleApp());
}
