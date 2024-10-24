import 'package:flutter/material.dart';

class FlutterFreezed extends StatefulWidget {
  const FlutterFreezed({super.key});

  @override
  State<FlutterFreezed> createState() => _FlutterFreezedState();
}

class _FlutterFreezedState extends State<FlutterFreezed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Freezed Example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_shopping_cart_rounded),
      ),
    );
  }
}
