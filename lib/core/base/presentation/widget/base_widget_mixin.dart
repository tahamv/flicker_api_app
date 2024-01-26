import 'package:flicker_api_app/core/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum SnackBarType { error, warning, normal }

mixin BaseWidgetMixin {
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return null;
  }

  Color? pageBackgroundColor(context) {
    return Theme.of(context).background;
  }

  List<Widget> appBarActions(BuildContext context) {
    return [const SizedBox()];
  }

  List<dynamic> setBlocProviders(BuildContext context) {
    return [];
  }

  bool removeBottomInset() {
    return true;
  }

  Widget body(BuildContext context) {
    return const SizedBox();
  }
}
