import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo/bloc/switch/switch_event.dart';
import 'package:flutter_bloc_demo/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchStates> {
  SwitchBloc() : super(const SwitchStates()) {
    on<EnableOrDisableTranslation>(_enableOrDisableTranslation);
  }

  void _enableOrDisableTranslation(
      EnableOrDisableTranslation event, Emitter<SwitchStates> emit) {
    emit(state.copyWith(value: !state.isSwitchOn));
  }
}
