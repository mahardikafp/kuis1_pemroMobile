import 'package:flutter/material.dart';
import 'package:q/main.dart';
import 'package:q/pages/card.dart';
import 'package:q/pages/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var ListMenu = [
    Menu(
        id: 1,
        nama_menu: 'Kentang Goreng',
        qty: 0,
        harga: 10000,
        gambar: 'food2.jpg'),
    Menu(id: 2, nama_menu: 'Bakso', qty: 0, harga: 10000, gambar: 'food3.jpg'),
    Menu(
        id: 3, nama_menu: 'Mi Ayam', qty: 0, harga: 10000, gambar: 'food4.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    int total = 0;
    for (var i = 0; i < ListMenu.length; i++) {
      total += ListMenu[i].harga * ListMenu[i].qty;
    }
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text('Jual Makanan'),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('TOTAL:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text('RP $total',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: ListView(
          children: ListMenu.map((menu) => InkWell(
                onTap: () async {
                  var result = await Navigator.of(context)
                      .pushNamed('/detail', arguments: {
                    'menu': menu,
                  });
                  _handleNavResult(result, menu);
                },
                child: MenuCard(Menu(
                    id: menu.id,
                    nama_menu: menu.nama_menu,
                    harga: menu.harga,
                    qty: menu.qty,
                    gambar: menu.gambar)),
              )).toList()),
    );
  }

  void _handleNavResult(Object? result, Menu menu) {
    if (result != null) {
      var resultMap = result as Map<String, Object>;
      if (resultMap.containsKey('qty')) {
        var qty = resultMap['qty'];
        if (qty is int) {
          int _qty = qty;
          var index = ListMenu.indexOf(menu);
          if (index >= 0) {
            setState(() {
              ListMenu[index] = Menu(
                  id: menu.id,
                  nama_menu: menu.nama_menu,
                  harga: menu.harga,
                  qty: _qty,
                  gambar: menu.gambar);
            });
          }
        }
      }
    }
  }
}
