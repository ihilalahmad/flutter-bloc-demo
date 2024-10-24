import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/counter/counter_event.dart';
import 'package:flutter_bloc_demo/bloc/counter/counter_state.dart';
import 'package:flutter_bloc_demo/ui/favorite_app_screen.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Counter Bloc'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavoriteAppScreen()));
              },
              child: const Text('Next'),
            ),
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 50),
              );
            }),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCount());
                      },
                      child: const Text('Increment'),
                    );
                  },
                ),
                const SizedBox(
                  width: 24,
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementCount());
                      },
                      child: const Text('Decrement '),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
