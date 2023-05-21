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
      // appBar: AppBar(
      //   title: Text('Currency Converter'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _fromController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                _convert();
              },
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _fromCurrency,
              items: ['IDR', 'KRW', 'USD']
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
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _toCurrency,
              items: ['IDR', 'KRW', 'USD']
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
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _toController,
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}