import 'package:flutter/widgets.dart';
import 'package:nd_coordinators/nd_flow_coordinator.dart';

mixin NDWidgetBuilderable {
  late final WidgetBuilder? widgetBuilder;
}

mixin NDNamable {
  late final String? name;
}

abstract class NDNavigatorCoordinator<ResultType>
    extends NDFlowCoordinator<ResultType> with NDNamable, NDWidgetBuilderable {}
