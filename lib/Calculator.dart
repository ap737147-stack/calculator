import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/calculator_bloc.dart';
import 'bloc/calculator_event.dart';
import 'bloc/calculator_state.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Calculator", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          BlocBuilder<CalculatorBloc, CalculatorState>(
            builder: (context, state) {
              return Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(16),
                height: 270,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (state.expression.isNotEmpty)
                      Text(
                        state.expression,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 30,
                        ),
                      ),
                    const SizedBox(height: 8),
                    Text(
                      state.display,
                      style: const TextStyle(color: Colors.white, fontSize: 48),
                    ),
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    _buildButton(context, 'C', Colors.red),
                    _buildButton(context, '⌫', Colors.red),
                    _buildButton(context, '%', Colors.red),
                    _buildButton(context, '÷', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _buildButton(context, '7', Colors.grey.shade800),
                    _buildButton(context, '8', Colors.grey.shade800),
                    _buildButton(context, '9', Colors.grey.shade800),
                    _buildButton(context, '×', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _buildButton(context, '4', Colors.grey.shade800),
                    _buildButton(context, '5', Colors.grey.shade800),
                    _buildButton(context, '6', Colors.grey.shade800),
                    _buildButton(context, '-', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _buildButton(context, '1', Colors.grey.shade800),
                    _buildButton(context, '2', Colors.grey.shade800),
                    _buildButton(context, '3', Colors.grey.shade800),
                    _buildButton(context, '+', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _buildButton(context, '0', Colors.grey.shade800),
                    _buildButton(context, '.', Colors.grey.shade800),
                    _buildButton(context, '=', Colors.green),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => _onPressed(context, text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _onPressed(BuildContext context, String value) {
    final bloc = context.read<CalculatorBloc>();

    switch (value) {
      case 'C':
        bloc.add(ClearPressed());
        break;
      case '⌫':
        bloc.add(BackspacePressed());
        break;
      case '+':
      case '-':
      case '×':
      case '÷':
        bloc.add(OperationPressed(value));
        break;
      case '=':
        bloc.add(EqualsPressed());
        break;
      case '.':
        bloc.add(DecimalPressed());
        break;
      case '%':
        bloc.add(PercentagePressed());
        break;
      default:
        bloc.add(NumberPressed(value));
    }
  }
}
