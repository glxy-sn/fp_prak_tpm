import 'package:flutter/material.dart';

class Kesan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kesan dan Pesan'),
        backgroundColor: Color.fromRGBO(38, 58, 41, 1),
      ),
      body: Container(
        // color: Color.fromRGBO(242, 227, 219, 1),
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Kesan dan Pesan Kelas TPM:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'capek :(',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
