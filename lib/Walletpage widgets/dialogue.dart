import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class InputDialog extends StatefulWidget {
  final Function(List<String>) onSubmit;

  InputDialog({required this.onSubmit});

  @override
  _InputDialogState createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  String _selectedType = 'Visa';
  final _formKey = GlobalKey<FormState>();


  String? _validateTotalBalance(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the total balance';
    }
    final balance = double.tryParse(value);
    if (balance == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  String? _validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the card number';
    }
    if (value.length != 16) {
      return 'Card number must be 16 digits';
    }
    return null;
  }
  String? _validateExpirationDate(String? value) {

    if (value == null || value.isEmpty) {
      return 'Please enter the expiration date';
    }

    final expRegExp = RegExp(r'^(0[1-9]|1[0-2])/([0-9]{2})$');
    if (!expRegExp.hasMatch(value)) {
      return 'Exp date must be in MM/YY format';
    }


    final parts = value.split('/');
    final month = int.parse(parts[0]);
    final year = int.parse(parts[1]);
    final currentYear = DateTime.now().year % 100;
    final currentMonth = DateTime.now().month;



    // Check if the year is in the past
    if (year < currentYear || (year == currentYear && month < currentMonth)) {
      return 'Expiration date cannot be in the past';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Card Information'),
      content: Form(
        key: _formKey,
      child:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _controller1,
            decoration: InputDecoration(hintText: 'Total Balance'),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))],
            validator: _validateTotalBalance,
          ),
          TextFormField(
            controller: _controller2,
            decoration: InputDecoration(hintText: 'Card Number'),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(16)],
            validator: _validateCardNumber,
          ),
          TextFormField(
            controller: _controller3,
            decoration: InputDecoration(hintText: 'Expiration Date MM/YY'),
            keyboardType: TextInputType.datetime,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d{0,2}\/?\d{0,2}'))],
            validator: _validateExpirationDate,
          ),
          DropdownButton<String>(
            value: _selectedType,
            onChanged: (String? newValue) {
              setState(() {
                _selectedType = newValue!;
              });
            },
            items: <String>['Visa', 'Mastercard']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Submit'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              List<String> inputs = [
                _controller1.text,
                _controller2.text,
                _controller3.text,
                _selectedType.toLowerCase(),
              ];
              widget.onSubmit(inputs);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}