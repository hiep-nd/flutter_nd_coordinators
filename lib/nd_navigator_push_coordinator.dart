import 'package:flutter/material.dart';
import 'package:nd_coordinators/nd_navigator_coordinator.dart';

class NDNavigatorPushCoordinator<ResultType>
    extends NDNavigatorCoordinator<ResultType> {
  // NDCoordinator
  @override
  Future<ResultType?> start(BuildContext context) {
    if (widgetBuilder == null) {
      return Future.value(null);
    }

    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: widgetBuilder!,
        settings: RouteSettings(name: name),
        fullscreenDialog: false,
      ),
    );
  }

  // NDNavigatorPushCoordinator
  NDNavigatorPushCoordinator({
    String? name,
    required WidgetBuilder widgetBuilder,
  }) {
    this.name = name;
    this.widgetBuilder = widgetBuilder;
  }
}
