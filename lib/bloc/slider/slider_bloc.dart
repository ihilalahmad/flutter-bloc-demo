import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo/bloc/slider/slider_event.dart';
import 'package:flutter_bloc_demo/bloc/slider/slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderStates> {
  SliderBloc() : super(const SliderStates()) {
    on<ChangeSliderValue>(_changeSliderValue);
  }

  void _changeSliderValue(ChangeSliderValue event, Emitter<SliderStates> emit) {
    emit(state.copyWith(sliderValue: event.sliderValue));
  }
}
