import 'package:flutter/widgets.dart';
import 'package:nd_coordinators/nd_flow_coordinator.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

abstract class NDClosureNavigatorCoordinator<ResultType>
    extends NDFlowCoordinator<ResultType>
    with NDDisposable, NDClosureDisposable {
  final String? name;
  final WidgetBuilder? builder;

  NDClosureNavigatorCoordinator({
    this.name,
    this.builder,
  });
}
