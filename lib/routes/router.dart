import 'package:auto_route/auto_route.dart';
import 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom();

  @override
  final List<AutoRoute> routes = <AutoRoute>[
    AutoRoute(
      path: '/',
      initial: true,
      page: SplashScreen.page,
    ),
    AutoRoute(
      path: '/home',
      page: HomeScreen.page,
    ),
    AutoRoute(
      path: '/search',
      page: SearchScreen.page,
    ),
    AutoRoute(
      path: '/manga',
      page: MangaScreen.page,
    ),
    AutoRoute(
      path: '/anime',
      page: AnimeScreen.page,
    ),
    AutoRoute(
      path: '/gridmenu',
      page: MoreMenuScreen.page,
    ),
    AutoRoute(
      path: '/profile',
      page: ProfileScreen.page,
    ),
  ];
}
