import 'package:flutter/material.dart';
import 'package:nd_coordinators/nd_coordinators.dart';

void main() {
  final flow1Coordinator = MyFlowCoordinator();

  final entryCoordinator = NDEmbeddedCoordinator(
      builder: (context) => EntryPage(onPressed: flow1Coordinator.start));

  final appCoordinator = NDApplicationCoordinator(
    builder: () => MyApp(
      builder: entryCoordinator.build,
    ),
  );

  appCoordinator.startApp();
}

class MyFlowCoordinator extends NDFlowCoordinator {
  @override
  Future<bool?> start(BuildContext context) async {
    // 1 -> 3 -> 2
    _step1 = NDNavigatorPushCoordinator(
      name: 'Step 1',
      widgetBuilder: (context) {
        return StepPage(
            value: '1', onPressed: (context) => _step2?.start(context));
      },
    );

    _step2 = NDNavigatorPushCoordinator(
      name: 'Step 2',
      widgetBuilder: (context) {
        return StepPage(
            value: '3', onPressed: (context) => _step3?.start(context));
      },
    );

    _step3 = NDNavigatorPushCoordinator(
      name: 'Step 3',
      widgetBuilder: (context) {
        return StepPage(
          value: '2',
          onPressed: (context) => Navigator.of(context).popUntil(
            ModalRoute.withName('Step 1'),
          ),
        );
      },
    );

    _step1?.start(context);
  }

  // Privates
  NDFlowCoordinator? _step1;
  NDFlowCoordinator? _step2;
  NDFlowCoordinator? _step3;
}

class MyApp extends StatelessWidget {
  final WidgetBuilder builder;

  const MyApp({
    Key? key,
    required this.builder,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: builder(context),
    );
  }
}

class EntryPage extends StatelessWidget {
  final Function(BuildContext context) onPressed;

  const EntryPage({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Start'),
          onPressed: () => onPressed(context),
        ),
      ),
    );
  }
}

class StepPage extends StatelessWidget {
  final String value;
  final void Function(BuildContext) onPressed;

  const StepPage({
    Key? key,
    required this.value,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(value),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => onPressed(context),
          child: const Text('Next'),
        ),
      ),
    );
  }
}
