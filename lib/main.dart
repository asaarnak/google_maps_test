import 'package:flutter/material.dart';
import 'package:google_maps_test/navigation/app_route_parser.dart';
import 'package:google_maps_test/navigation/app_router.dart';
import 'package:google_maps_test/navigation/app_router_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _appRouterManager = AppRouterManager();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _appRouterManager,
      child: MaterialApp.router(
        title: 'Google Maps Test',
        backButtonDispatcher: RootBackButtonDispatcher(),
        routeInformationParser: const AppRouteParser(),
        routerDelegate: AppRouter(
          appRouterManager: _appRouterManager,
        ),
      ),
    );
  }
}
