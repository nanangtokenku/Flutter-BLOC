import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Produk extends StatefulWidget {
  @override
  _Produk createState() => _Produk();
}

class _Produk extends State<Produk> with SingleTickerProviderStateMixin {
  //create controller untuk tabBar
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
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
        title: Text('Produk'), //bottom
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.email),
            ),
            new Tab(
              icon: new Icon(Icons.queue_music),
            ),
            new Tab(
              icon: new Icon(Icons.shopping_cart),
            ),
            new Tab(
              icon: new Icon(Icons.phone_android),
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Katalog'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}
