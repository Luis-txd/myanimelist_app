// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:roku_for_mal/ui/screens/anime/user_anime_screen.dart' as _i1;
import 'package:roku_for_mal/ui/screens/home/home_screen.dart' as _i2;
import 'package:roku_for_mal/ui/screens/manga/manga_screen.dart' as _i3;
import 'package:roku_for_mal/ui/screens/more_menu/more_menu_screen.dart' as _i4;
import 'package:roku_for_mal/ui/screens/profile/profile_screen.dart' as _i5;
import 'package:roku_for_mal/ui/screens/search/search_screen.dart' as _i6;
import 'package:roku_for_mal/ui/screens/seasonal/seasonal_screen_v0.5.dart'
    as _i7;
import 'package:roku_for_mal/ui/screens/splashscreen/splash_screen.dart' as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AnimeScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AnimeScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    MangaScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MangaScreen(),
      );
    },
    MoreMenuScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MoreMenuScreen(),
      );
    },
    ProfileScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileScreen(),
      );
    },
    SearchScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SearchScreen(),
      );
    },
    SeasonalScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SeasonalScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AnimeScreen]
class AnimeScreen extends _i9.PageRouteInfo<void> {
  const AnimeScreen({List<_i9.PageRouteInfo>? children})
      : super(
          AnimeScreen.name,
          initialChildren: children,
        );

  static const String name = 'AnimeScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreen extends _i9.PageRouteInfo<void> {
  const HomeScreen({List<_i9.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MangaScreen]
class MangaScreen extends _i9.PageRouteInfo<void> {
  const MangaScreen({List<_i9.PageRouteInfo>? children})
      : super(
          MangaScreen.name,
          initialChildren: children,
        );

  static const String name = 'MangaScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MoreMenuScreen]
class MoreMenuScreen extends _i9.PageRouteInfo<void> {
  const MoreMenuScreen({List<_i9.PageRouteInfo>? children})
      : super(
          MoreMenuScreen.name,
          initialChildren: children,
        );

  static const String name = 'MoreMenuScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileScreen extends _i9.PageRouteInfo<void> {
  const ProfileScreen({List<_i9.PageRouteInfo>? children})
      : super(
          ProfileScreen.name,
          initialChildren: children,
        );

  static const String name = 'ProfileScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SearchScreen]
class SearchScreen extends _i9.PageRouteInfo<void> {
  const SearchScreen({List<_i9.PageRouteInfo>? children})
      : super(
          SearchScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SeasonalScreen]
class SeasonalScreen extends _i9.PageRouteInfo<void> {
  const SeasonalScreen({List<_i9.PageRouteInfo>? children})
      : super(
          SeasonalScreen.name,
          initialChildren: children,
        );

  static const String name = 'SeasonalScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashScreen]
class SplashScreen extends _i9.PageRouteInfo<void> {
  const SplashScreen({List<_i9.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
