import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Produk2 extends StatefulWidget {
  @override
  _Produk2 createState() => _Produk2();
}

// ignore: must_be_immutable
class _Produk2 extends State<Produk2> {
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
    fetchData();
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategori"),
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
  }
}
