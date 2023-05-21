import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled/login/login.dart';
import 'package:untitled/login/widget.dart';

Future<void> register(String name, String email, String password) async {
  final url = Uri.parse('http://localhost/flutter/registration.php'); // Replace with the URL of your registration script

  final response = await http.post(
    url,
    body: {
      'name': name,
      'email': email,
      'password': password,
    },
  );

  if (response.statusCode == 200) {
    // Registration successful
    print('Registration successful');
  } else {
    // Registration failed
    print('Registration failed');
  }
}
class RegisterScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        backgroundColor: Color.fromRGBO(38, 58, 41, 1),
      ),
      body: Container(
        color: Color.fromRGBO(242, 227, 219, 1),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 300,
            ),
            reusableTextField("Name", Icons.person_outline, false,
                _nameController),
            SizedBox(
              height: 20,
            ),
            // TextField(
            //   controller: _nameController,
            //   decoration: InputDecoration(
            //     labelText: 'Name',
            //   ),
            // ),
            reusableTextField("Email", Icons.email, false,
                _emailController),
            SizedBox(
              height: 20,
            ),
            // TextField(
            //   controller: _emailController,
            //   decoration: InputDecoration(
            //     labelText: 'Email',
            //   ),
            // ),
            // SizedBox(height: 16.0),
            reusableTextField("Enter Password", Icons.lock_outline, true,
                _passwordController),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                final String name = _nameController.text;
                final String email = _emailController.text;
                final String password = _passwordController.text;

                register(name, email, password);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(38, 58, 41, 1), // Warna latar belakang tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Mengatur radius sudut tombol
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                child: Text(
                  'Register',
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

  // void _register() {
  //   final String name = _nameController.text;
  //   final String email = _emailController.text;
  //   final String password = _passwordController.text;
  //
  //   register(name, email, password);
  //
  // }
}
