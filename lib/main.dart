import 'package:flutter/material.dart';
import 'package:musify_mobile/presentation/app/app.dart';
import 'package:musify_mobile/presentation/di/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initInjector();
  runApp(const MusifyApp());
}
