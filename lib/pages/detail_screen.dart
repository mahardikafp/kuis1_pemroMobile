import 'package:flutter/material.dart';
import 'package:q/main.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Menu? _menu;
  int _jumlah = 0;

  void tambah() {
    setState(() {
      _jumlah++;
    });
  }

  void kurang() {
    setState(() {
      _jumlah--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    if (args.containsKey('menu')) {
      var menu = args['menu'];
      if (menu is Menu) {
        _menu = menu;
        if (_jumlah < 0) {
          _jumlah = _menu?.qty ?? -1;
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
          height: double.infinity,
          width: double.infinity,
          child: Card(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Card(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Image.asset(
                            'images/${_menu?.gambar}',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.35,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            'Menu :',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _menu?.nama_menu ?? '',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Harga :',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rp ${_menu?.harga ?? ''}',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Jumlah  :',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: kurang,
                                  icon: Icon(Icons.remove_circle)),
                              Text('$_jumlah'),
                              IconButton(
                                  onPressed: tambah,
                                  icon: Icon(Icons.add_circle)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop({'qty': _jumlah});
                                },
                                child: Text('Konfirmasi',
                                    style: TextStyle(fontSize: 20)),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.lightGreen),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
