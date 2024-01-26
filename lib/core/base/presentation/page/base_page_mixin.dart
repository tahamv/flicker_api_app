import 'package:flicker_api_app/core/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

mixin BasePageMixin {
  int? tabControllerLength(BuildContext context) {
    return null;
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

  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      actions: appBarActions(context),
      leadingWidth: double.maxFinite,
      leading: InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 8.0,
            ),
            Icon(
              Icons.arrow_back,
              color: Theme.of(context).primary,
            ),
          ],
        ),
        onTap: () {
          context.pop();
        },
      ),
    );
  }

  void onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  bool safeArea() {
    return true;
  }

  bool endDrawerEnableOpenDragGesture() {
    return false;
  }

  Widget body(BuildContext context) {
    return const SizedBox();
  }

  Widget annotatedRegion(BuildContext context) {
    return Material(
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          //Status bar color for android
          statusBarColor: Theme.of(context).background,
          statusBarIconBrightness: Theme.of(context).statusBarIconBrightness,
        ),
        child: setBlocProviders(context).isNotEmpty
            ? MultiBlocProvider(
                providers: [...setBlocProviders(context)],
                child: Builder(
                  builder: (context) {
                    return _buildSafeArea(context);
                  },
                ),
              )
            : _buildSafeArea(context),
      ),
    );
  }

  void willPop(bool state) {}

  Widget _buildSafeArea(BuildContext context) {
    return safeArea() ? SafeArea(child: _buildScaffold(context)) : _buildScaffold(context);
  }

  Widget _buildScaffold(BuildContext context) {
    return PopScope(
      onPopInvoked: willPop,
      child: tabControllerLength(context) != null
          ? DefaultTabController(
              length: tabControllerLength(context)!,
              child: Scaffold(
                //Status bar color for iOS
                backgroundColor: Theme.of(context).background,
                appBar: buildAppBar(context),
                body: body(context),
                resizeToAvoidBottomInset: removeBottomInset(),
                endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture(),
                bottomNavigationBar: bottomNavigationBar(context),
              ),
            )
          : Scaffold(
              //Status bar color for iOS
              resizeToAvoidBottomInset: removeBottomInset(),
              backgroundColor: Theme.of(context).background,
              appBar: buildAppBar(context),
              body: body(context),
              endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture(),
              bottomNavigationBar: bottomNavigationBar(context),
            ),
    );
  }

  Widget? bottomNavigationBar(BuildContext context) {
    return null;
  }
}
