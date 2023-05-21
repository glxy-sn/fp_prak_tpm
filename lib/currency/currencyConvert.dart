import 'package:flutter/material.dart';
class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();
  String _fromCurrency = 'IDR';
  String _toCurrency = 'USD';
  double _result = 0.0;

  @override
  void initState() {
    _toController = TextEditingController();
    super.initState();
  }

  void _convert() {
    double input = double.tryParse(_fromController.text) ?? 0.0;

    if (_fromCurrency == 'IDR' && _toCurrency == 'KRW') {
      _result = input * 0.090;
    } else if (_fromCurrency == 'IDR' && _toCurrency == 'USD') {
      _result = input * 0.000068;
    } else if (_fromCurrency == 'KRW' && _toCurrency == 'IDR') {
      _result = input * 11.09;
    } else if (_fromCurrency == 'KRW' && _toCurrency == 'USD') {
      _result = input * 0.00075;
    } else if (_fromCurrency == 'USD' && _toCurrency == 'IDR') {
      _result = input * 14807.00 ;
    } else if (_fromCurrency == 'USD' && _toCurrency == 'KRW') {
      _result = input * 1335.54;
    }

    setState(() {
      _toController.text = _result.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),            TextField(
              controller: _fromController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                _convert();
              },
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white.withOpacity(0.9)),
              decoration: InputDecoration(
                labelText: 'From',
                labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Color.fromRGBO(65, 100, 74, 1),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
              ),
            ),
                DropdownButtonFormField<String>(
                  value: _fromCurrency,
                  items: ['','IDR', 'KRW', 'USD']
                      .map((currency) => DropdownMenuItem(
                    child: Text(currency),
                    value: currency,
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _fromCurrency = value!;
                    });
                    _convert();
                  },
                ),
            SizedBox(height: 50.0),
            TextField(
              controller: _toController,
              enabled: false,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white.withOpacity(0.9)),
              decoration: InputDecoration(
                labelText: 'To',
                labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Color.fromRGBO(65, 100, 74, 1),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
              ),
            ),
                SizedBox(width: 16.0),
                DropdownButtonFormField<String>(
                      value: _toCurrency,
                      items: ['','IDR', 'KRW', 'USD']
                          .map((currency) => DropdownMenuItem(
                        child: Text(currency),
                        value: currency,
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _toCurrency = value!;
                        });
                        _convert();
                      },
                    )
              ],
            ),
      ),
    );
  }
}