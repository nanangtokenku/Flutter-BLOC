import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Laporan extends StatefulWidget {
  @override
  _Laporan createState() => _Laporan();
}

// ignore: must_be_immutable
class _Laporan extends State<Laporan> {
  List<dynamic> _data = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://stok.laksanaelang.net/web/stok?tanggalDari=2023-04-26&tanggalSampai=2023-05-31'));
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
        title: Text("Laporan Stok"),
      ),
      body: _data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 6 / 10,
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
                          ('assets/produk.jpeg'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Nama : " + item['namaproduk'],
                                  //"Nanang Aja",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Awal : " + item['awal'].toString(),
                                  //"Nanang Aja",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Masuk : " + item['stokmasuk'].toString(),
                                  //"Nanang Aja",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Keluar : " + item['stokkeluar'].toString(),
                                  //"Nanang Aja",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Saldo : " + item['sisa'].toString(),
                                  //"Nanang Aja",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
