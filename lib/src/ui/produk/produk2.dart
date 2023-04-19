import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Produk2 extends StatelessWidget {
  List<dynamic> _data = [];

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    final List<dynamic> data = json.decode(response.body);
    //setState(() {
    // _data = data;
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategori"),
      ),
      body: _data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
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
                        child: Image.network(
                          item['url'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          item['albumId'].toString(),
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
