import 'package:flicker_api_app/common/constants/environment.dart';
import 'package:flutter/material.dart';

late Environment environment;

class ConstKeeper {
  static String buildNumber = '';
  static String version = '';
  static String? firebaseToken = '';
  static String? phoneModel = '';
  static String? appToWebTokenQueryParameter = 'app_to_web_token';
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();

  static const String deeplinkSchema = "apollon://apollon.uk.com/";
}
