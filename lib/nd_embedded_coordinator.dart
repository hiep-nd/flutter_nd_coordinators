import 'package:flutter/widgets.dart';

class NDEmbeddedCoordinator {
  final WidgetBuilder builder;

  NDEmbeddedCoordinator({
    required this.builder,
  });

  Widget build(BuildContext context) => builder(context);
}
