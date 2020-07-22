import 'dart:math';

class CalculateBrain {
  final int weight;
  final int height;

  double _bmi;
  final Map<String, String> _messages = {};

  CalculateBrain({this.weight, this.height});

  String get getMessage => this._messages.keys.elementAt(0);
  String get getInterpretation => this._messages.values.elementAt(0);

  String calculateBMI() {
    _bmi = this.weight / pow((this.height / 100), 2);

    _identifyImplement();

    return _bmi.toStringAsFixed(1);
  }

  void _identifyImplement() {
    if (_bmi >= 25) {
      this._messages['Overweight'] =
          'You have a higher body than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      this._messages['Normal'] = 'You have a normal body weight. Good job';
    } else {
      this._messages['Underweight'] =
          'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
