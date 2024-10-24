import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {

  @override
  List<Object?> get props => [];
}

class EnableOrDisableTranslation extends SwitchEvent {}