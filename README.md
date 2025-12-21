# 🧮 Flutter Calculator App with BLoC Pattern

A modern, feature-rich calculator application built with Flutter using the BLoC (Business Logic Component) pattern for state management. This project demonstrates clean architecture principles and separation of concerns.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![BLoC](https://img.shields.io/badge/BLoC-02569B?style=for-the-badge&logo=flutter&logoColor=white)

## ✨ Features

- ✅ Basic arithmetic operations (Addition, Subtraction, Multiplication, Division)
- ✅ Percentage calculations
- ✅ Decimal point support
- ✅ Backspace functionality
- ✅ Clear/Reset function
- ✅ Live expression display
- ✅ Error handling (division by zero)
- ✅ Clean and intuitive UI
- ✅ BLoC pattern for state management
- ✅ Responsive design

## 📱 Screenshots

```
[Display Area]
Expression: 15 + 20 =
Result: 35

[Button Layout]
C  ⌫  %  ÷
7  8  9  ×
4  5  6  -
1  2  3  +
0  .  =
```

## 🏗️ Architecture

This app follows the BLoC pattern with clear separation of concerns:

```
lib/
├── bloc/
│   ├── calculator_event.dart    # All calculator events
│   ├── calculator_state.dart    # Application state
│   └── calculator_bloc.dart     # Business logic
├── Calculator.dart              # UI layer (presentation)
└── main.dart                    # App entry point
```

### Components:

- **Events** (`calculator_event.dart`): User actions (button presses)
- **States** (`calculator_state.dart`): Application data (display, expression, etc.)
- **BLoC** (`calculator_bloc.dart`): Business logic that transforms events into states
- **UI** (`Calculator.dart`): Presentation layer that reacts to state changes
- **Main** (`main.dart`): App initialization and BLoC provider setup

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code with Flutter extensions
- An emulator or physical device

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/calculator-app.git
cd calculator-app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3  # State management
  equatable: ^2.0.5     # Value equality
```

## 🎯 BLoC Pattern Implementation

### Events
```dart
- NumberPressed      // When user presses 0-9
- OperationPressed   // When user presses +, -, ×, ÷
- EqualsPressed      // When user presses =
- ClearPressed       // When user presses C
- BackspacePressed   // When user presses ⌫
- DecimalPressed     // When user presses .
- PercentagePressed  // When user presses %
```

### State
```dart
class CalculatorState {
  final String display;          // Current number display
  final String expression;       // Operation expression
  final double result;           // Calculation result
  final String operation;        // Current operation
  final double operand;          // First operand
  final bool shouldResetDisplay; // Flag for display reset
}
```

## 🎨 UI Features

### Color Scheme
- **Background**: Black
- **Display**: White text on black background
- **Number Buttons**: Grey (#grey.shade800)
- **Operation Buttons**: Orange
- **Function Buttons**: Red (Clear, Backspace, Percentage)
- **Equals Button**: Green

### Layout
- Top section: Expression and result display (300px height)
- Bottom section: 4×4 button grid with expandable buttons
- Rounded corners (12px border radius)
- Consistent padding (6px between buttons, 22px inside buttons)

## 🧪 Testing

### Unit Tests (Recommended)
```bash
flutter test
```

### Example Test Cases
```dart
// Test number input
test('Should add number to display', () { ... });

// Test arithmetic operations
test('Should perform addition correctly', () { ... });

// Test clear functionality
test('Should clear all values', () { ... });

// Test division by zero handling
test('Should show error on division by zero', () { ... });

// Test percentage calculations
test('Should calculate percentage', () { ... });

// Test state transitions
test('Should reset display after operation', () { ... });
```

### Widget Tests
Test the UI components in `Calculator.dart`:
```dart
testWidgets('Calculator has required buttons', (tester) async { ... });
testWidgets('Display updates on button press', (tester) async { ... });
```

### BLoC Tests
Test the business logic separately:
```dart
blocTest<CalculatorBloc, CalculatorState>(
  'emits correct state when number is pressed',
  build: () => CalculatorBloc(),
  act: (bloc) => bloc.add(NumberPressed('5')),
  expect: () => [CalculatorState(display: '5')],
);
```

## 📁 Project Structure

```
calculator/
├── android/                     # Android specific files
├── ios/                         # iOS specific files
├── lib/
│   ├── bloc/
│   │   ├── calculator_bloc.dart    # Business logic
│   │   ├── calculator_event.dart   # Event definitions
│   │   └── calculator_state.dart   # State management
│   ├── Calculator.dart             # UI components
│   └── main.dart                   # App entry point
├── test/                        # Test files
├── pubspec.yaml                 # Dependencies
└── README.md                    # This file
```

## 📝 File Descriptions

### `main.dart`
- App initialization
- BLoC provider setup
- Material app configuration

### `Calculator.dart`
- UI layout and design
- Button grid implementation
- Display area with expression and result
- Event dispatching to BLoC

### `calculator_event.dart`
- Defines all user interaction events
- Number, operation, and function button events

### `calculator_state.dart`
- Immutable state class
- Stores display, expression, and calculation data
- copyWith method for state updates

### `calculator_bloc.dart`
- Core business logic
- Event handlers for all calculator operations
- Calculation algorithms
- State transformation logic

### BLoC Pattern
- [Official BLoC Documentation](https://bloclibrary.dev/)
- [Flutter BLoC Package](https://pub.dev/packages/flutter_bloc)

### Flutter
- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

## 🔧 Customization

### Change Colors
Edit the color values in `Calculator.dart`:
```dart
_buildButton(context, 'C', color: Colors.red),  // Function buttons
_buildButton(context, '7', color: Colors.grey.shade800),  // Number buttons
_buildButton(context, '+', color: Colors.orange),  // Operation buttons
```

### Modify Display Height
In `Calculator.dart`, change the display container height:
```dart
Container(
  alignment: Alignment.bottomRight,
  padding: EdgeInsets.all(16),
  height: 300,  // Change this value
  ...
)
```

### Add New Operations
1. Add new event in `lib/bloc/calculator_event.dart`
2. Add handler in `lib/bloc/calculator_bloc.dart`
3. Add button in `Calculator.dart` UI
4. Update `_onButtonPressed` method to handle the new operation

## 🐛 Known Issues

- None at the moment

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 Changelog

### Version 1.0.0 (Initial Release)
- Basic calculator operations
- BLoC pattern implementation
- Clean UI design
- Error handling

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

Alok Pandey
- GitHub: (https://github.com/ap737147-stack)
- Email: ap737147@gmail.com

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- BLoC library maintainers
- The Flutter community

## 📞 Support

For support,email ap737147@gmail.com or create an issue in this repository.

---

**Made with ❤️ using Flutter**

