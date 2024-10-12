import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'ui/restart_widget.dart';

void main() async {
  runZonedGuarded(() async {
    final WidgetsBinding widgetsBindings = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBindings);

    // init sharedPres (local storage??)

    runApp(
      RestartWidget(
        child: ProviderScope(child: MyApp()),
      ),
    );
  }, (Object error, StackTrace stack) {});

  //runApp(const MyApp());
}
