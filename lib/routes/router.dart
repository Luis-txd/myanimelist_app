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
    ),
    AutoRoute(
      path: "/search",
      page: SearchScreen.page,
      initial: false,
    ),
    AutoRoute(
      path: "/manga",
      page: MangaScreen.page,
      initial: false,
    ),
    AutoRoute(
      path: "/anime",
      page: AnimeScreen.page,
      initial: false,
    ),
    AutoRoute(
      path: "/gridmenu",
      page: MoreMenuScreen.page,
      initial: false,
    ),
    
  ];
}
