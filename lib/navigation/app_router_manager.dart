import 'package:flutter/foundation.dart';

class AppRouterManager extends ChangeNotifier {
  bool _tapOnMap = false;

  bool get didTapOnMap => _tapOnMap;

  void tapOnMap({required bool selected}) {
    _tapOnMap = selected;
    notifyListeners();
  }
}
