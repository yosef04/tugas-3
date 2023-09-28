import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_3/settings.dart';
import 'package:tugas_3/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var username;
  Color headerColor = ColorManager().headerColor;
  void _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    username = prefs.getString('username');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _loadUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text('Selamat Datang di Beranda, User $username')),
            ),
            const SizedBox(height: 50,),
            const Icon(Icons.home, size: 90,)
          ],
        ),
      ),
      drawer: SideMenu(headerColor: headerColor),
    );
  }
}
