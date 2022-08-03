import 'package:flutter/widgets.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

abstract class NDApplicationCoordinator {
  void startApp();
}

class NDClosureApplicationCoordinator
    with NDApplicationCoordinator, NDDisposable, NDClosureDisposable {
  // NDClosureApplicationCoordinator
  final Widget Function() builder;

  NDClosureApplicationCoordinator({
    required this.builder,
  });

  @override
  void startApp() {
    runApp(builder());
  }
}
