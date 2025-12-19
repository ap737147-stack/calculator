import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class NumberPressed extends CalculatorEvent {
  final String number;

  const NumberPressed(this.number);

  @override
  List<Object> get props => [number];
}

class OperationPressed extends CalculatorEvent {
  final String operation;

  const OperationPressed(this.operation);

  @override
  List<Object> get props => [operation];
}

class EqualsPressed extends CalculatorEvent {}

class ClearPressed extends CalculatorEvent {}

class BackspacePressed extends CalculatorEvent {}

class DecimalPressed extends CalculatorEvent {}

  class PercentagePressed extends CalculatorEvent {}