import 'package:flicker_api_app/common/constants/const_keeper.dart';
import 'package:flicker_api_app/common/constants/environment.dart';
import 'package:flicker_api_app/core/config/locale/locale_configs.dart';
import 'package:flicker_api_app/core/config/routes/go_route.dart';
import 'package:flicker_api_app/core/config/theme/app_theme.dart';
import 'package:flicker_api_app/core/di/base/di_setup.dart';
import 'package:flicker_api_app/core/services/language_theme/language_theme_cubit.dart';
import 'package:flicker_api_app/core/services/language_theme/language_theme_state.dart';
import 'package:flicker_api_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlickerApiApp extends StatefulWidget {
  const FlickerApiApp({super.key});

  @override
  State<FlickerApiApp> createState() => _FlickerApiAppState();
}

class _FlickerApiAppState extends State<FlickerApiApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          final bloc = getIt<ThemeAndLanguageCubit>();
          bloc.changeLanguage(manualSelectLanguageType: LanguageType.en);
          bloc.changeTheme(manualSelectThemeType: ThemeType.light);
          return bloc;
        }),
      ],
      child: BlocBuilder<ThemeAndLanguageCubit, ThemeAndLanguageState>(
        builder: (context, state) {
          return MaterialApp.router(
            key: ConstKeeper.navigatorKey,
            scaffoldMessengerKey: ConstKeeper.snackBarKey,
            debugShowCheckedModeBanner: false,
            locale: context.read<ThemeAndLanguageCubit>().locale!,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: LocaleConfigs.localizationsDelegates,
            title: getMaterialAppTitle(),
            theme: context.read<ThemeAndLanguageCubit>().themeData!,
            routerDelegate: AppRoute.router.routerDelegate,
            routeInformationParser: AppRoute.router.routeInformationParser,
            routeInformationProvider: AppRoute.router.routeInformationProvider,
          );
        },
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      switch (state) {
        case AppLifecycleState.inactive:
          break;
        case AppLifecycleState.resumed:
          break;
        case AppLifecycleState.paused:
          break;
        case AppLifecycleState.detached:
          break;
        case AppLifecycleState.hidden:
          break;
      }
    });
  }

  String getMaterialAppTitle() {
    if (environment is Stage) {
      return 'WebSocketStage';
    } else if (environment is Dev) {
      return 'WebSocketDev';
    } else {
      return 'WebSocket';
    }
  }
}
