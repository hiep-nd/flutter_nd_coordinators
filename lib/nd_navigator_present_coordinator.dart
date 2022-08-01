//
// nd_coordinator.dart
// nd_coordinators
//
// Created by Nguyen Duc Hiep on Fri May 06 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nd_coordinators/nd_navigator_coordinator.dart';

class NDNavigatorPresentCoordinator<ResultType>
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
        fullscreenDialog: true,
      ),
    );
  }

  // NDNavigatorPresentCoordinator
  NDNavigatorPresentCoordinator({
    String? name,
    required WidgetBuilder widgetBuilder,
  }) {
    this.name = name;
    this.widgetBuilder = widgetBuilder;
  }
}
