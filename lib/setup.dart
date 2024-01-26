import 'package:flicker_api_app/core/di/base/di_setup.dart';
import 'package:flutter/material.dart';

Future<void> setupApp({required Widget app}) async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(app);
}
