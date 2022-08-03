//
// nd_closure_navigator_present_coordinator.dart
// nd_coordinators
//
// Created by Nguyen Duc Hiep on Fri May 06 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:nd_coordinators/nd_closure_navigator_coordinator.dart';

class NDClosureNavigatorPresentCoordinator<ResultType>
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
        fullscreenDialog: true,
      ),
    );
  }

  // NDClosureNavigatorPresentCoordinator
  NDClosureNavigatorPresentCoordinator({
    String? name,
    WidgetBuilder? builder,
  }) : super(name: name, builder: builder);
}
