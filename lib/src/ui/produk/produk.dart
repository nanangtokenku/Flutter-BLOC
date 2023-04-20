import 'dart:convert';

import 'package:aztira/src/ui/produk/produk1.dart';
import 'package:aztira/src/ui/produk/produk2.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../../utils/app_tool.dart';

class Produk extends StatefulWidget {
  @override
  _Produk createState() => _Produk();
}

class _Produk extends State<Produk> with SingleTickerProviderStateMixin {
  //create controller untuk tabBar
  TabController controller;
  List<dynamic> _data = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://api.jogjaide.web.id/web/card'));
    final List<dynamic> data = json.decode(response.body);
    setState(() {
      _data = data;
    });
  }

  @override
  void initState() {
    handleLoginSession(context);
    controller = new TabController(vsync: this, length: 2);
    fetchData();
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Katalog'), //bottom
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              text: "Produk",
              icon: new Icon(Icons.add_photo_alternate_outlined),
            ),
            new Tab(
              text: "Kategori",
              icon: new Icon(Icons.list),
            ),
          ],
        ),
      ),
      body: _data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: _data.length,
              itemBuilder: (context, index) {
                final item = _data[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          //item['url'],
                          ('assets/profile_pic.jpg'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item['name'],
                          //"Nanang Aja",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      //   child: Text(
                      //     item['albumId'].toString(),
                      //     style: TextStyle(
                      //       color: Colors.grey[600],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
            ),
    );

    // new TabBarView(
    //     //controller untuk tab bar
    //     controller: controller,
    //     children: <Widget>[
    //       //kemudian panggil halaman sesuai tab yang sudah dibuat
    //       new Produk1(),
    //       new Produk2()
    //     ],
    //   ),
  }
}
