import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_3/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passworController = TextEditingController();

  _buatInput(controller, placeholder, label, isPassword) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: placeholder,
          labelText: label,
        ),
        obscureText: isPassword,
      ),
    );
  }

  void _saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setString('username', _usernameController.text);
  }

  _tampilDialog(placeholder, page) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(placeholder),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => page));
                  },
                  child: const Text("OK"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.amberAccent,
          ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 400,
          width: 500,
          child: Card(
            elevation: 4, // Add elevation for the Card shadow
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Rounded corners for the Card
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text('Login', style: TextStyle(fontSize: 25)),
                  _buatInput(_usernameController, 'Masukkan Username',
                      'Username', false),
                  _buatInput(_passworController, 'Masukkan Password',
                      'Password', true),
                  ElevatedButton(
                      onPressed: () {
                        String username = _usernameController.text;
                        String password = _passworController.text;
                        print(username);
                        print(password);
                        if (username == 'admin' && password == 'admin') {
                          _saveUser();
                          _tampilDialog('Login berhasil', const HomePage());
                        } else {
                          _tampilDialog('Gagal Login', const LoginPage());
                        }
                      },
                      child: const Text('Login'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
