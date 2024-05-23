import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:projeto_sos/src/core/bindings/application_binding.dart';
import 'package:projeto_sos/src/feature/home/home_module.dart';
import 'package:projeto_sos/src/feature/splash/splash_module.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      bindings: ApplicationBinding(),
      modules: [SplashModule(), HomeModule()],
      builder: (context, routes, getitNavigator) => AsyncStateBuilder(
        builder: (asyncNavigator) => MaterialApp(
          routes: routes,
          navigatorObservers: [getitNavigator, asyncNavigator],
        ),
      ),
    );
  }
}
