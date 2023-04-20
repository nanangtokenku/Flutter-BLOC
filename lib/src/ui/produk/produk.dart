import 'package:aztira/src/ui/produk/produk1.dart';
import 'package:flutter/material.dart';
import '../../utils/app_tool.dart';
import 'produk2.dart';

class Produk extends StatefulWidget {
  @override
  _Produk createState() => _Produk();
}

class _Produk extends State<Produk> with SingleTickerProviderStateMixin {
  //create controller untuk tabBar
  TabController controller;

  @override
  void initState() {
    handleLoginSession(context);
    controller = new TabController(vsync: this, length: 2);

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
            unselectedLabelColor:
                Color.alphaBlend(Colors.yellow, Colors.yellow),
            tabs: <Widget>[
              //Color: Colors.yellow,
              //BackgroundColor: Colors.yellow, // set background color
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
        body: new TabBarView(
          //controller untuk tab bar
          controller: controller,
          children: <Widget>[
            //kemudian panggil halaman sesuai tab yang sudah dibuat
            new Produk1(),
            new Produk2()
          ],
        ));
  }
}
