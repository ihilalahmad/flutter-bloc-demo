import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/slider/slider_bloc.dart';
import 'package:flutter_bloc_demo/bloc/slider/slider_event.dart';
import 'package:flutter_bloc_demo/bloc/slider/slider_state.dart';
import 'package:flutter_bloc_demo/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_demo/bloc/switch/switch_event.dart';
import 'package:flutter_bloc_demo/bloc/switch/switch_state.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Switch & Slider'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Translation'),
                BlocBuilder<SwitchBloc, SwitchStates>(
                  builder: (context, state) {
                    return Switch(
                        value: state.isSwitchOn,
                        onChanged: (newValue) {
                          context
                              .read<SwitchBloc>()
                              .add(EnableOrDisableTranslation());
                        });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SliderBloc, SliderStates>(
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Theme.of(context).colorScheme.primary.withOpacity(state.sliderValue),
                );
              },
            ),

            const SizedBox(
              height: 50,
            ),
            BlocBuilder<SliderBloc, SliderStates>(
              builder: (context, state) {
                return Slider(value: state.sliderValue, onChanged: (value) {
                    context.read<SliderBloc>().add(ChangeSliderValue(sliderValue: value));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
