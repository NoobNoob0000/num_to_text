import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/context/text_styles.dart';

class Control extends StatefulWidget {
  Control({
    super.key,
    this.onPressed,
    this.controller,
    this.maxNumber,
    this.minNumber,
  });

  final maxNumber;
  final minNumber;
  final onPressed;
  final controller;

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly, // Chỉ cho phép nhập số
            ],
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Enter a number',
              hintText:
                  'Number only (between ${widget.minNumber} and ${widget.maxNumber})',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a number';
              }
              int? number = int.tryParse(value);
              if (number == null) {
                return 'Invalid number';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: widget.onPressed,
          child: Text(
            'Submit',
            style: MainPageTextStyle.buttonText(context),
          ),
        ),
      ],
    );
  }
}
