import 'package:auto_route/auto_route.dart';

import 'AppRouter.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      initial: true,
    ),
  ];
}
