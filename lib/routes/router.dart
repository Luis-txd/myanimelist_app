import 'package:auto_route/auto_route.dart';
import 'package:myanimelist_app/routes/router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      initial: true,
      page: SplashScreen.page,
    ),
    AutoRoute(
      path: "/home",
      page: HomeScreen.page,
      initial: false,
    )
  ];
}
