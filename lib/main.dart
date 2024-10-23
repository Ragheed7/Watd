import 'package:flutter/material.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/core/routing/app_router.dart';
import 'package:waie/waie_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(Waie(
    appRouter: AppRouter(),
  ));
}

