import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled/login/login.dart';

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
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
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
              //onPressed: ,
              child: Text('Register'),
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
