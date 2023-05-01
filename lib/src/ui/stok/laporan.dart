import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Laporan extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<Laporan> {
  List _dataList = [];

  @override
  void initState() {
    super.initState();
    _fetchDataFromAPI();
  }

  Future<void> _fetchDataFromAPI() async {
    String url =
        "https://stok.laksanaelang.net/web/stok?tanggalDari=2023-04-26&tanggalSampai=2023-05-31";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    setState(() {
      _dataList = jsonData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My List View"),
      ),
      body: _dataList.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _dataList.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  value:
                      _dataList[index]["namaproduk"] == 'true' ? true : false,
                  title: Text(_dataList[index]["namaproduk"]),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(_dataList[index]["kode"] != null
                                  ? _dataList[index]["kode"]
                                  : ''),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Awal : " +
                                  _dataList[index]["awal"].toString() +
                                  " Masuk : " +
                                  _dataList[index]["stokmasuk"].toString() +
                                  " Keluar : " +
                                  _dataList[index]["stokkeluar"].toString() +
                                  " Saldo : " +
                                  _dataList[index]["sisa"].toString()),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  onChanged: (newvalue) {
                    setState(() {});
                    //});
                  },
                  secondary: IconButton(
                    icon: Icon(Icons.info_outline),
                    onPressed: () {
                      //showPopup(context);
                    },
                  ),
                );
              },
            ),
    );
  }
}
