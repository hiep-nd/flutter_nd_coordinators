import 'package:flutter/widgets.dart';

class NDApplicationCoordinator {
  // NDNavigatorPushCoordinator
  final Widget Function() builder;

  NDApplicationCoordinator({
    required this.builder,
  });

  void startApp() {
    runApp(builder());
  }
}
