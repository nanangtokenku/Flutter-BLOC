import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                height: 200,
                width: 350,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50, //we give the image a radius of 50
                      backgroundImage: NetworkImage(
                          'https://webstockreview.net/images/male-clipart-professional-man-3.jpg'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
//CrossAxisAlignment.end ensures the components are aligned from the right to left.
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          width: 150,
                          color: Colors.black54,
                          height: 2,
                        ),
                        const SizedBox(height: 4),
                        const Text('+62 8 123 540 1617'),
                        const Text('Makassar City'),
                        const Text('Programmer'),
                      ],
                    ),
                  ],
                ))));
  }
}
