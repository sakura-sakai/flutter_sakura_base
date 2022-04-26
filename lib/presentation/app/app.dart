import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../route/router.dart';
import '../theme/theme.dart';
import 'app_responsive.dart';

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.read(routerProvider);
    final appRouterObserver = ref.read(routerObserverProvider);

    return AppResponsive(
      child: MaterialApp.router(
        title: 'Sakura Base',
        // Theme
        theme: kLightThemeData,
        darkTheme: kDarkThemeData,

        // Router
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(
          appRouter,
          navigatorObservers: () => [appRouterObserver],
        ),

        // Locale
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
