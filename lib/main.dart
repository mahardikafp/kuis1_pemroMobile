import 'package:flutter/material.dart';
import 'package:q/pages/detail_screen.dart';
import 'package:q/pages/home_screen.dart';

void main() {
  runApp(Keranjang());
}

class Menu {
  String nama_menu, gambar;
  int harga, qty, id;

  Menu(
      {required this.nama_menu,
      required this.gambar,
      required this.harga,
      required this.id,
      required this.qty});
}

class Keranjang extends StatelessWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        '/home': (BuildContext ctx) => HomeScreen(),
        '/detail': (BuildContext ctx) => DetailScreen(),
      },
    );
  }
}
