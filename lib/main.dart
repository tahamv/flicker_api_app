import 'package:flicker_api_app/app.dart';
import 'package:flicker_api_app/common/constants/const_keeper.dart';
import 'package:flicker_api_app/common/constants/environment.dart';
import 'package:flicker_api_app/setup.dart';
import 'package:flutter/material.dart';

void main() async {
  environment = Dev();
  await setupApp(
    app: const Banner(
      location: BannerLocation.bottomStart,
      layoutDirection: TextDirection.ltr,
      textDirection: TextDirection.ltr,
      message: 'Dev',
      textStyle: TextStyle(color: Color(0xFF006FFD)),
      color: Color(0xFFE1ECFB),
      child: FlickerApiApp(),
    ),
  );
}
