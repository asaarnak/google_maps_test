import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_test/navigation/app_router_manager.dart';
import 'package:google_maps_test/navigation/pages.dart';
import 'package:google_maps_test/pages/home_page.dart';
import 'package:google_maps_test/pages/map_page.dart';

class AppRouter extends RouterDelegate<String>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  AppRouter({
    required AppRouterManager appRouterManager,
  })  : navigatorKey = GlobalKey<NavigatorState>(),
        _appRouterManager = appRouterManager {
    _appRouterManager.addListener(notifyListeners);
  }
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppRouterManager _appRouterManager;

  @override
  void dispose() {
    _appRouterManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        HomePage.page(),
        if (_appRouterManager.didTapOnMap) ...[
          MapPage.page(),
        ],
      ],
    );
  }

  // Called when [pop] is invoked but the current [Route] corresponds to a
  // [Page] found in the [pages] list.
  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    if (route.settings.name == Pages.mapPath) {
      _appRouterManager.tapOnMap(selected: false);
    }

    return true;
  }

  // Logic that maps a specific app state to a specific URL
  @override
  String get currentConfiguration {
    if (_appRouterManager.didTapOnMap) {
      return Pages.mapPath;
    }
    return Pages.homePath;
  }

  // Logic that maps a specific URL path to a specific screen
  @override
  Future<void> setNewRoutePath(String configuration) async {
    if (configuration == Pages.mapPath) {
      _appRouterManager.tapOnMap(selected: true);
    }
    return;
  }
}
