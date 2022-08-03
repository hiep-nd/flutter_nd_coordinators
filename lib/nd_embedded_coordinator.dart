import 'package:flutter/widgets.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

abstract class NDEmbeddedCoordinator {
  Widget build(BuildContext context);
}

class NDClosureEmbeddedCoordinator
    with NDEmbeddedCoordinator, NDDisposable, NDClosureDisposable {
  // NDEmbeddedCoordinator
  @override
  Widget build(BuildContext context) => builder(context);

  // NDClosureEmbeddedCoordinator
  final WidgetBuilder builder;

  NDClosureEmbeddedCoordinator({
    required this.builder,
  });
}
