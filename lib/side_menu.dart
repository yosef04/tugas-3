import 'package:flutter/material.dart';
import 'package:tugas_3/home_page.dart';
import 'package:tugas_3/settings.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key, this.headerColor}) : super(key: key);
  final headerColor;
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: widget.headerColor ?? const Color.fromARGB(255, 33, 187, 243),
            ),
            child: const Text(
              'Side Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Beranda'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Pengaturan'),
            onTap: () {
              // Aksi yang diambil ketika menu Pengaturan dipilih
              // Misalnya, navigasi ke halaman Pengaturan.
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),
          // Tambahkan item-menu lain sesuai kebutuhan
        ],
      ),
    );
  }
}
