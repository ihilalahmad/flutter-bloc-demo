import 'package:bloc/bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCount>(_increment);
    on<DecrementCount>(_decrement);
  }

  void _increment(IncrementCount event, Emitter<CounterState> emit) {
    if(state.counter < 15){
      emit(state.copyWith(counter: state.counter + 1));
    }
  }

  void _decrement(DecrementCount event, Emitter<CounterState> emit) {
    if(state.counter != 0){
      emit(state.copyWith(counter: state.counter - 1));
    }
  }
}
