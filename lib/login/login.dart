// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:untitled/dashboard.dart';
// import 'package:untitled/login/register.dart';
// import 'package:untitled/login/widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// final TextEditingController _emailController = TextEditingController();
// final TextEditingController _passwordController = TextEditingController();
// bool _showError = false;
//
//
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//         automaticallyImplyLeading: false,
//         backgroundColor: Color.fromRGBO(38, 58, 41, 1),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         color: Color.fromRGBO(242, 227, 219, 1),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const SizedBox(
//               height: 300,
//             ),
//             reusableTextField("Enter Email", Icons.person_outline, false,
//                 _emailController),
//             const SizedBox(
//               height: 20,
//             ),
//             SizedBox(height: 24.0),
//             reusableTextField("Enter Password", Icons.lock_outline, true,
//                 _passwordController),
//             const SizedBox(
//               height: 80,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _login(context);
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Color.fromRGBO(38, 58, 41, 1), // Warna latar belakang tombol
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0), // Mengatur radius sudut tombol
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//                 child: Text(
//                   'Login',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white, // Warna teks tombol
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 24.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Don't have account?",
//                     style: TextStyle(color: Colors.black)),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => RegisterScreen()));
//                   },
//                   child: const Text(
//                     " Sign Up",
//                     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             if (_showError)
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 8.0),
//                 child: Text(
//                   'Invalid email or password',
//                   style: TextStyle(
//                     color: Colors.red,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//   Future<void> _login(BuildContext context) async {
//     final String email = _emailController.text;
//     final String password = _passwordController.text;
//
//     final response = await http.post(
//       Uri.parse('http://localhost/flutter/login-fix.php'),
//       body: {
//         'email': email,
//         'password': password,
//       },
//     );
//
//     if (response.statusCode == 200) {
//       final message = response.body;
//
//       if (message.toLowerCase().contains('login successful')) {
//         // Save login status to shared preferences
//         SharedPreferences prefsdata = await SharedPreferences.getInstance();
//         await prefsdata.setBool('isLoggedIn', true);
//         // Login success
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Dashboard()),
//         );
//         _emailController.clear();
//         _passwordController.clear();
//       } else {
//         // Login failed
//         setState(() {
//           _showError = true;
//         });
//       }
//     } else {
//       // Failed to connect to server
//       setState(() {
//         _showError = true;
//       });
//     }
//   }
// }
//
//
//
//
//
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/dashboard.dart';
import 'package:untitled/login/register.dart';
import 'package:untitled/login/widget.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
bool _showError = false;
bool _rememberMe = false;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _checkLoginStatus();

    setState(() {
      _rememberMe = _prefs.getBool('rememberMe') ?? false;
      if (_rememberMe) {
        _emailController.text = _prefs.getString('email') ?? '';
        _passwordController.text = _prefs.getString('password') ?? '';
      }
    });
  }

  void _checkLoginStatus() {
    bool isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      _emailController.text = _prefs.getString('email') ?? '';
      _passwordController.text = _prefs.getString('password') ?? '';
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => Dashboard()),
      // );
    }
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
            reusableTextField(
              "Enter Email",
              Icons.person_outline,
              false,
              _emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(height: 24.0),
            reusableTextField(
              "Enter Password",
              Icons.lock_outline,
              true,
              _passwordController,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors.white,
                    checkboxTheme: CheckboxThemeData(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  child: Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                    activeColor: Color.fromRGBO(38, 58, 41, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const Text('Remember Me'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                _login(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(38, 58, 41, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Padding(
                padding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: const Text(
                    " Sign Up",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            if (_showError)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Invalid email or password',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    final response = await http.post(
      Uri.parse('http://localhost/flutter/login-fix.php'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final message = response.body;

      if (message.toLowerCase().contains('login successful')) {
        await _prefs.setBool('isLoggedIn', true);

        if (_rememberMe) {
          await _prefs.setString('email', email);
          await _prefs.setString('password', password);
          await _prefs.setBool('rememberMe', true);
        } else {
          await _prefs.remove('email');
          await _prefs.remove('password');
          await _prefs.setBool('rememberMe', false);
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
        _emailController.clear();
        _passwordController.clear();
      } else {
        // Login failed
        setState(() {
          _showError = true;
        });
      }
    } else {
      // Failed to connect to server
      setState(() {
        _showError = true;
      });
    }
  }
}
