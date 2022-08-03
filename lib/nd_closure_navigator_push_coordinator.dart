import 'package:flutter/material.dart';
import 'package:nd_coordinators/nd_closure_navigator_coordinator.dart';

class NDClosureNavigatorPushCoordinator<ResultType>
    extends NDClosureNavigatorCoordinator<ResultType> {
  // NDClosureNavigatorCoordinator
  @override
  Future<ResultType?> start(BuildContext context) {
    if (builder == null) {
      return Future.value(null);
    }

    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: builder!,
        settings: RouteSettings(name: name),
        fullscreenDialog: false,
      ),
    );
  }

  // NDNavigatorPushCoordinator
  NDClosureNavigatorPushCoordinator({
    String? name,
    WidgetBuilder? builder,
  }) : super(name: name, builder: builder);
}
