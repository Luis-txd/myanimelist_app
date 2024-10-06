import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myanimelist_app/ui/restart_widget.dart';

import 'app.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsBinding widgetsBindings = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBindings);

    // init sharedPres (local storage??)

    runApp(
      RestartWidget(
        child: ProviderScope(child: MyApp()),
      ),
    );
  }, (error, stack) {});

  //runApp(const MyApp());
}
