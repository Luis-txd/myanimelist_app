import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../data/remote/interceptor/generic_error_interceptor.dart';
import '../../../routes/router.gr.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    GenericErrorInterceptor.initialize(context);
    WidgetsBinding.instance.addPostFrameCallback((Duration timestamp) {
      _loadData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadData() async {
    _checkConnectivity();
    return;
  }

  Future<void> _proceed() async {
    FlutterNativeSplash.remove();
    //TODO auth validation, send to auth screen if user not logged in
    context.router.replaceAll(<PageRouteInfo>[const HomeScreen()]);
  }

  Future<void> _checkConnectivity() async {
    final bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      _proceed();
    } else {
      //TODO:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
