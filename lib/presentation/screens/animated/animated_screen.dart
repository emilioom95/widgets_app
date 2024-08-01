import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimatedScreen extends StatelessWidget {

  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/buttons');
            },
            child: const Text('Go to Snackbars'),
          );
    return const Placeholder();
  }
}