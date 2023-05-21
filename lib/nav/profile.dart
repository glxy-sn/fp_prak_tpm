import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String imageUrl = "https://media.licdn.com/dms/image/C5603AQEsz-ewfslI9g/profile-displayphoto-shrink_800_800/0/1656823087720?e=2147483647&v=beta&t=qFJQWsRLl2K2kfi1P7doUKZ4QMDHpgd90-0MVvqsJ9w";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 90.0,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 16.0),
            Text(
              'NIM: 123200052',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Nama: Shafa Tiara Tsabita Himawan',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage()),
                );
              },
              child: Text('Detail'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String imageUrl = "https://media.licdn.com/dms/image/C5603AQEsz-ewfslI9g/profile-displayphoto-shrink_800_800/0/1656823087720?e=2147483647&v=beta&t=qFJQWsRLl2K2kfi1P7doUKZ4QMDHpgd90-0MVvqsJ9w";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 90.0,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 16.0),
            Text(
              'NIM: 123200052',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Nama: Shafa Tiara Tsabita Himawan',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Kelas: IF - H',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Tempat Lahir: Yogyakarta',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Tanggal Lahir: 31 Mei 2002',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Harapan/Cita-Cita: Menjadi orang kaya',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}