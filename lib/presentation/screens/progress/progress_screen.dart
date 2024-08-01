import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _ProgressView(),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/');
            },
            child: const Text('Ir al inicio'),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/snackbars');
            },
            child: const Text('Ir al siguiente'),
          ),
        ],
      ),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [
        SizedBox(
          height: 30,
        ),
        Text('Circular Progress Indicator'),
        CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Colors.black12,
        ),
        SizedBox(
          height: 20,
        ),
        Text('Circular indicator controlado'),
        SizedBox(
          height: 10,
        ),
        _ControlledProgresIndicator()
      ]),
      
    );
  }
}

class _ControlledProgresIndicator extends StatelessWidget {
  const _ControlledProgresIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;

          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    value: progressValue,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                      child: LinearProgressIndicator(
                    value: progressValue,
                  ))
                ],
              ));
              
        });
  }
}