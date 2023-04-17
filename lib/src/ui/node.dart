import 'package:aztira/src/models/nodeModel.dart';
import 'package:flutter/material.dart';
import 'package:aztira/src/blocs/nodeBloc.dart';

import '../utils/AppPreferences.dart';
import 'login/LoginScreen.dart';

class Nodepage extends StatefulWidget {
  @override
  _NodepageState createState() => _NodepageState();
}

class _NodepageState extends State<Nodepage> {
  @override
  void initState() {
    nodebloc.fetchAllTodo();
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
          title: Text("List Pelanggan"),
        ),
        body: StreamBuilder(
          stream: nodebloc.allNode,
          builder: (context, AsyncSnapshot<List<Node>> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Widget buildList(AsyncSnapshot<List<Node>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          value: snapshot.data[index].done == 'true' ? true : false,
          title: Text(snapshot.data[index].name),
          subtitle: Text(
              snapshot.data[index].id != null ? snapshot.data[index].id : ''),
          onChanged: (bool isChecked) {},
        );
      },
    );
  }
}
