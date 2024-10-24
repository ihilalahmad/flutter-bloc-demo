import 'package:equatable/equatable.dart';

class SliderStates extends Equatable {
  final double sliderValue;

  const SliderStates({this.sliderValue = 0.0});

  SliderStates copyWith({double? sliderValue}) {
    return SliderStates(sliderValue: sliderValue ?? this.sliderValue);
  }

  @override
  List<Object?> get props => [sliderValue];
}
