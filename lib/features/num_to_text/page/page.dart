import 'package:flutter/material.dart';

import '../widgets/control.dart';
import '../widgets/num_text.dart';

class NumToTextPage extends StatefulWidget {
  const NumToTextPage({super.key});

  @override
  State<NumToTextPage> createState() => _NumToTextPageState();
}

class _NumToTextPageState extends State<NumToTextPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController(text: '0');
  var _text = 'zero';

  // Giới hạn số tối thiểu và tối đa
  final int minNumber = 0;
  final int maxNumber = 999;

  String _numToText() {
    int number = int.parse(_controller.text);
    if (number < 0 || number > 999) {
      return 'Out of ability';
    }

    // Bước 5: đọc các số có ba chữ số
    if (number >= 100) {
      int hundreds = number ~/ 100;
      int remainder = number % 100;
      return "${readDigit(hundreds)} hundred${remainder != 0 ? ' and ${readNumber(remainder)}' : ''}";
    } else {
      return readNumber(number);
    }
  }

  // Bước 2, 3, 4: Hàm đọc số có 1 hoặc 2 chữ số
  String readNumber(int num) {
    if (num < 10) {
      return readDigit(num);
    } else if (num < 20) {
      return readTeens(num);
    } else {
      int tens = num ~/ 10;
      int ones = num % 10;
      return "${readTens(tens)}${ones != 0 ? ' ${readDigit(ones)}' : ''}";
    }
  }

// Hàm đọc số có 1 chữ số
  String readDigit(int digit) {
    switch (digit) {
      case 0:
        return "zero";
      case 1:
        return "one";
      case 2:
        return "two";
      case 3:
        return "three";
      case 4:
        return "four";
      case 5:
        return "five";
      case 6:
        return "six";
      case 7:
        return "seven";
      case 8:
        return "eight";
      case 9:
        return "nine";
      default:
        return "";
    }
  }

// Hàm đọc số từ 10 đến 19
  String readTeens(int num) {
    switch (num) {
      case 10:
        return "ten";
      case 11:
        return "eleven";
      case 12:
        return "twelve";
      case 13:
        return "thirteen";
      case 14:
        return "fourteen";
      case 15:
        return "fifteen";
      case 16:
        return "sixteen";
      case 17:
        return "seventeen";
      case 18:
        return "eighteen";
      case 19:
        return "nineteen";
      default:
        return "";
    }
  }

// Hàm đọc số hàng chục từ 20 trở lên
  String readTens(int tens) {
    switch (tens) {
      case 2:
        return "twenty";
      case 3:
        return "thirty";
      case 4:
        return "forty";
      case 5:
        return "fifty";
      case 6:
        return "sixty";
      case 7:
        return "seventy";
      case 8:
        return "eighty";
      case 9:
        return "ninety";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Num to text'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 3,
                ),
                Control(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _text = _numToText();
                      });
                    }
                  },
                  controller: _controller,
                  maxNumber: maxNumber,
                  minNumber: minNumber,
                ),
                const Spacer(
                  flex: 1,
                ),
                NumText(text: _text),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
