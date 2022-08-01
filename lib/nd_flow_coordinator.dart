import 'package:flutter/widgets.dart';

abstract class NDFlowCoordinator<ResultType> {
  Future<ResultType?> start(BuildContext context);
}
