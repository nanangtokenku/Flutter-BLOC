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
        title: Text('Laporan Stok'),
      ),
      body: _dataList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Produk')),
                  DataColumn(label: Text('Awal')),
                  DataColumn(label: Text('Masuk')),
                  DataColumn(label: Text('Keluar')),
                  DataColumn(label: Text('Saldo')),
                ],
                rows: _dataList
                    .map((data) => DataRow(cells: [
                          DataCell(Text(data['namaproduk'].toString())),
                          DataCell(Text(data['awal'].toString())),
                          DataCell(Text(data['stokmasuk'].toString())),
                          DataCell(Text(data['stokkeluar'].toString())),
                          DataCell(Text(data['sisa'].toString())),
                        ]))
                    .toList(),
              ),
            ),
    );
  }
}
