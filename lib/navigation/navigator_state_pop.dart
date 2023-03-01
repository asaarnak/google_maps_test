import 'package:flutter/widgets.dart';

VoidCallback getOnTapBack({
  required BuildContext context,
  GlobalKey<NavigatorState>? navigatorKey,
}) {
  return () async {
    await onTapBack(
      context: context,
      navigatorKey: navigatorKey,
    );
  };
}

Future<void> onTapBack({
  required BuildContext context,
  GlobalKey<NavigatorState>? navigatorKey,
}) async {
  final NavigatorState navigatorState;
  if (navigatorKey != null) {
    navigatorState = navigatorKey.currentState ?? Navigator.of(context);
  } else {
    navigatorState = Navigator.of(context);
  }
  await maybePop(
    navigatorState: navigatorState,
  );
}

/// Same bubble up logic like native Back button tap with Navigator 2
Future<void> maybePop({
  required NavigatorState navigatorState,
}) async {
  final result = await navigatorState.maybePop();
  if (!result) {
    if (!navigatorState.mounted) {
      return;
    }
    final parent =
        navigatorState.context.findAncestorStateOfType<NavigatorState>();
    if (parent != null) {
      await maybePop(
        navigatorState: parent,
      );
    }
  }
}
