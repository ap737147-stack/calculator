class CalculatorState {
  final String expression;
  final String display;
  final bool shouldResetDisplay;

  const CalculatorState({
    this.expression = '',
    this.display = '0',
    this.shouldResetDisplay = false,
  });

  CalculatorState copyWith({
    String? expression,
    String? display,
    bool? shouldResetDisplay,
  }) {
    return CalculatorState(
      expression: expression ?? this.expression,
      display: display ?? this.display,
      shouldResetDisplay: shouldResetDisplay ?? this.shouldResetDisplay,
    );
  }
}
