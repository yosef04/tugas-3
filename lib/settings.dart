import 'package:flutter/material.dart';
import 'package:tugas_3/side_menu.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // Properti untuk menyimpan warna header
  Color headerColor = ColorManager().headerColor; // Mengambil warna dari ColorManager

  void changeHeaderColor(Color color) {
    setState(() {
      headerColor = color;
      ColorManager().headerColor = color; // Menyimpan warna ke ColorManager
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),
      drawer: SideMenu(headerColor: headerColor),
      body: Container(
        height: 500,
        padding: const EdgeInsets.all(10),
        child: Card(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              const Text(
                'Ubah Warna Header Side Menu:',
                style: TextStyle(fontSize: 16),
              ),
              ListTile(
                title: const Text('Biru'),
                onTap: () {
                  changeHeaderColor(Colors.blue);
                },
                trailing: headerColor == Colors.blue ? const Icon(Icons.check) : null,
              ),
              ListTile(
                title: const Text('Merah'),
                onTap: () {
                  changeHeaderColor(Colors.red);
                },
                trailing: headerColor == Colors.red ? const Icon(Icons.check) : null,
              ),
              ListTile(
                title: const Text('Hijau'),
                onTap: () {
                  changeHeaderColor(Colors.green);
                },
                trailing:
                    headerColor == Colors.green ? const Icon(Icons.check) : null,
              ),
              ListTile(
                title: const Text('Kuning'),
                onTap: () {
                  changeHeaderColor(Colors.yellow);
                },
                trailing:
                    headerColor == Colors.yellow ? const Icon(Icons.check) : null,
              ),
              ListTile(
                title: const Text('Orange'),
                onTap: () {
                  changeHeaderColor(Colors.orange);
                },
                trailing:
                    headerColor == Colors.orange ? const Icon(Icons.check) : null,
              ),
              // Tambahkan pilihan warna lainnya sesuai kebutuhan
            ],
          ),
        ),
      ),
    );
  }
}

class ColorManager {
  static final ColorManager _instance = ColorManager._internal();

  factory ColorManager() {
    return _instance;
  }

  ColorManager._internal();

  Color _headerColor = const Color.fromARGB(255, 33, 152, 243);

  Color get headerColor => _headerColor;

  set headerColor(Color color) {
    _headerColor = color;
  }
}
