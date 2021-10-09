import 'package:flutter/material.dart';
import 'package:q/main.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;
  MenuCard(this.menu);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightGreen,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'images/${menu.gambar}',
              width: 180,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(menu.nama_menu,
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                Text('Harga : Rp ${menu.harga}',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text('Jumlah :  ${menu.qty}',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
