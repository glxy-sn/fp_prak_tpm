import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String imageUrl = "https://media.licdn.com/dms/image/C5603AQEsz-ewfslI9g/profile-displayphoto-shrink_800_800/0/1656823087720?e=2147483647&v=beta&t=qFJQWsRLl2K2kfi1P7doUKZ4QMDHpgd90-0MVvqsJ9w";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromRGBO(38, 58, 41, 1),
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
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(38, 58, 41, 1), // Warna latar belakang tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Mengatur radius sudut tombol
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                child: Text(
                  'Detail',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks tombol
                  ),
                ),
              ),
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
        backgroundColor: Color.fromRGBO(38, 58, 41, 1),
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
              'Harapan/Cita-Cita: Hidup',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}