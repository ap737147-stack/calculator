import 'package:flutter_bloc/flutter_bloc.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState()) {
    on<NumberPressed>(_onNumber);
    on<OperationPressed>(_onOperation);
    on<EqualsPressed>(_onEquals);
    on<ClearPressed>(_onClear);
    on<BackspacePressed>(_onBackspace);
    on<DecimalPressed>(_onDecimal);
    on<PercentagePressed>(_onPercentage);
  }

  void _onNumber(NumberPressed e, Emitter emit) {
    final exp = state.shouldResetDisplay
        ? e.number
        : state.expression + e.number;

    emit(
      state.copyWith(
        expression: exp,
        display: _evaluate(exp),
        shouldResetDisplay: false,
      ),
    );
  }

  void _onOperation(OperationPressed e, Emitter emit) {
    if (state.expression.isEmpty) return;

    final exp = '${state.expression} ${e.operation} ';

    emit(state.copyWith(expression: exp));
  }

  void _onEquals(EqualsPressed e, Emitter emit) {
    emit(
      state.copyWith(
        display: _evaluate(state.expression),
        expression: '',
        shouldResetDisplay: true,
      ),
    );
  }

  void _onClear(ClearPressed e, Emitter emit) {
    emit(const CalculatorState());
  }

  void _onBackspace(BackspacePressed e, Emitter emit) {
    if (state.expression.isEmpty) return;

    final exp = state.expression.substring(0, state.expression.length - 1);

    emit(
      state.copyWith(
        expression: exp,
        display: exp.isEmpty ? '0' : _evaluate(exp),
      ),
    );
  }

  void _onDecimal(DecimalPressed e, Emitter emit) {
    if (state.expression.endsWith('.')) return;

    final exp = '${state.expression}.';

    emit(state.copyWith(expression: exp, display: _evaluate(exp)));
  }

  void _onPercentage(PercentagePressed e, Emitter emit) {
    if (state.expression.isEmpty) return;

    final value = double.tryParse(_evaluate(state.expression)) ?? 0;
    final result = value / 100;

    emit(
      state.copyWith(
        expression: '${state.expression} %',
        display: result == result.toInt()
            ? result.toInt().toString()
            : result.toString(),
        shouldResetDisplay: false,
      ),
    );
  }

  String _evaluate(String exp) {
    if (exp.isEmpty) return '0';

    try {
      List<String> tokens = exp
          .replaceAll('×', '*')
          .replaceAll('÷', '/')
          .replaceAll('%', '')
          .trim()
          .split(' ');

      for (int i = 0; i < tokens.length; i++) {
        if (tokens[i] == '*' || tokens[i] == '/') {
          double left = double.parse(tokens[i - 1]);
          double right = double.parse(tokens[i + 1]);

          double result = tokens[i] == '*' ? left * right : left / right;

          tokens[i - 1] = result.toString();
          tokens.removeAt(i);
          tokens.removeAt(i);
          i--;
        }
      }

      double result = double.parse(tokens[0]);

      for (int i = 1; i < tokens.length; i += 2) {
        double value = double.parse(tokens[i + 1]);

        if (tokens[i] == '+') {
          result += value;
        } else if (tokens[i] == '-') {
          result -= value;
        }
      }

      return result == result.toInt()
          ? result.toInt().toString()
          : result.toString();
    } catch (_) {
      return state.display;
    }
  }
}
