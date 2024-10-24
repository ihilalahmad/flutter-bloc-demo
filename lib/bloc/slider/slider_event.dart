import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SliderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeSliderValue extends SliderEvent {
  final double sliderValue;

  ChangeSliderValue({required this.sliderValue});

  @override
  List<Object?> get props => [sliderValue];
}
