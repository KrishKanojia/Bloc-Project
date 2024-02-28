import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isSwitch;
  final double value;
  const SwitchState({this.isSwitch = false, this.value = 1});

  SwitchState copyWith({bool? isSwitch, double? value}) {
    return SwitchState(
        isSwitch: isSwitch ?? this.isSwitch, value: value ?? this.value);
  }

  @override
  List<Object?> get props => [isSwitch, value];
}
