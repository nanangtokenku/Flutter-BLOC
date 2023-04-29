import 'package:flutter/material.dart';
import 'package:aztira/src/blocs/satuanBloc.dart';
import '../../models/satuanModel.dart';
import '../../utils/app_tool.dart';

class Satuanpage extends StatefulWidget {
  @override
  _SatuanpageState createState() => _SatuanpageState();
}

class _SatuanpageState extends State<Satuanpage> {
  @override
  void initState() {
    handleLoginSession(context);
    satuanbloc.fetchAllSatuann();
    super.initState();
  }

  @override
  void dispose() {
    //bloc.dispose();
    super.dispose();
  }

// Define a function to show the popup
  void showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Popup Satuan'),
          content: Text('May Add UOM.'),
          actions: [
            MaterialButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List Satuan"),
        ),
        body: StreamBuilder(
          stream: satuanbloc.allSatuan,
          builder: (context, AsyncSnapshot<List<Satuan>> snapshot) {
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

  Widget buildList(AsyncSnapshot<List<Satuan>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        List<String> checkedItems = [];

        return CheckboxListTile(
          value: snapshot.data[index].symbol == 'true' ? true : false,
          title: Text(snapshot.data[index].name),
          subtitle: Text(snapshot.data[index].symbol != null
              ? snapshot.data[index].symbol
              : ''),
          onChanged: (newvalue) {
            setState(() {
              if (newvalue) {
                checkedItems.add(snapshot.data[index].symbol);
              } else {
                checkedItems.remove(snapshot.data[index].symbol);
              }
              print("Checked items: ${checkedItems.join(', ')}");
            });
            //});
          },
          secondary: IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              showPopup(context);
            },
          ),
        );
      },
    );
  }
}
