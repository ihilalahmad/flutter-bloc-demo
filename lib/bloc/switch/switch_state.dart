import 'package:equatable/equatable.dart';

class SwitchStates extends Equatable {
  final bool isSwitchOn;

  const SwitchStates({this.isSwitchOn = false});

  SwitchStates copyWith({bool? value}) {
    return SwitchStates(isSwitchOn: value ?? isSwitchOn);
  }

  @override
  List<Object?> get props => [isSwitchOn];
}
