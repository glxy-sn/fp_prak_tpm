import 'dart:js';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled/dashboard.dart';
import 'package:untitled/login/register.dart';
import 'package:untitled/login/widget.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  void _login(BuildContext context) async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    final result = await login(email, password);

    if (result == true) {
      // Login successful, navigate to the dashboard screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } else if (result == false) {
      // Login failed, display an error message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid email or password. Please try again.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<bool> login(String email, String password) async {
    final url = Uri.parse('http://localhost/flutter/login-fix.php'); // Replace with the URL of your login script

    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    // if (response.statusCode == 200) {
    //   // Login successful
    //   print('Login successful');
    // } else {
    //   // Login failed
    //   print('Login failed');
    // }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(38, 58, 41, 1),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Color.fromRGBO(242, 227, 219, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 300,
            ),
            reusableTextField("Enter UserName", Icons.person_outline, false,
                _emailController),
            const SizedBox(
              height: 20,
            ),
            // TextField(
            //   controller: _emailController,
            //   decoration: InputDecoration(
            //     labelText: 'Email',
            //   ),
            // ),
            // SizedBox(height: 16.0),
            // TextField(
            //   controller: _passwordController,
            //   decoration: InputDecoration(
            //     labelText: 'Password',
            //   ),
            //   obscureText: true,
            // ),
            // SizedBox(height: 24.0),
            reusableTextField("Enter Password", Icons.lock_outline, true,
                _passwordController),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () {
                _login(context);
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
                  'Login',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks tombol
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have account?",
                    style: TextStyle(color: Colors.black)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()));
                  },
                  child: const Text(
                    " Sign Up",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }


  // void _login() {
  //   final String email = _emailController.text;
  //   final String password = _passwordController.text;
  //
  //   login(email, password);
  // }
}
