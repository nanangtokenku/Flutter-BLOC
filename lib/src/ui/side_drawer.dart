import 'package:aztira/src/ui/satuan/satuan.dart';
import 'package:flutter/material.dart';

import '../utils/AppPreferences.dart';
import 'about/about_us.dart';
import 'login/LoginScreen.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Nanang Rustianto"),
            accountEmail: Text("programmer@laksanaelang.com"),
            otherAccountsPictures: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.info,
                    color: Colors.white,
                    size: 36.0,
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute<bool>(
                          builder: (context) => AboutUsScreen()),
                    );
                  })
            ],
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              backgroundImage: AssetImage("assets/profile_pic.jpg"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.inbox),
            title: Text(
              "Satuan",
              key: ValueKey(SideDrawerKeys.INBOX),
            ),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute<bool>(builder: (context) => Satuanpage()),
              );
            },
          ),
          ListTile(
              onTap: () {},
              leading: Icon(Icons.calendar_today),
              title: Text(
                "Kategori",
                key: ValueKey(SideDrawerKeys.TODAY),
              )),
          ListTile(
              onTap: () {},
              leading: Icon(Icons.calendar_today),
              title: Text(
                "Produk",
                key: ValueKey(SideDrawerKeys.TODAY),
              )),
          ListTile(
              onTap: () {},
              leading: Icon(Icons.calendar_today),
              title: Text(
                "Stok Awal",
                key: ValueKey(SideDrawerKeys.TODAY),
              )),
          ListTile(
              onTap: () {},
              leading: Icon(Icons.calendar_today),
              title: Text(
                "Supplier",
                key: ValueKey(SideDrawerKeys.TODAY),
              )),
          ListTile(
              onTap: () {},
              leading: Icon(Icons.calendar_today),
              title: Text(
                "Pelanggan",
                key: ValueKey(SideDrawerKeys.TODAY),
              )),
          ListTile(
              onTap: () {},
              leading: Icon(Icons.calendar_today),
              title: Text(
                "Barang Masuk",
                key: ValueKey(SideDrawerKeys.TODAY),
              )),
          ListTile(
              onTap: () {},
              leading: Icon(Icons.calendar_today),
              title: Text(
                "Barang Keluar",
                key: ValueKey(SideDrawerKeys.TODAY),
              )),
          ListTile(
            onTap: () async {
              String name =
                  AppPreferences.getString('token', defaultValue: 'John Doe');
              print('cetak token sebelum is = ');
              print(name);
              await AppPreferences.setString('token', "");
              print('cetak token sesudah is = ');
              String name2 =
                  AppPreferences.getString('token', defaultValue: 'John Doe');
              print(name2);
              Navigator.push(
                context,
                MaterialPageRoute<bool>(builder: (context) => LoginPage()),
              );
            },
            leading: Icon(Icons.calendar_today),
            title: Text(
              "Logout",
              key: ValueKey(SideDrawerKeys.NEXT_7_DAYS),
            ),
          ),
        ],
      ),
    );
  }
}

class SideDrawerKeys {
  static const DRAWER = 'drawer';
  static const DRAWER_LABELS = 'drawerLabels';
  static const ADD_LABEL = 'addLabel';
  static const DRAWER_PROJECTS = 'drawerProjects';
  static const ADD_PROJECT = 'addProject';
  static const TODAY = 'today';
  static const INBOX = 'inbox';
  static const NEXT_7_DAYS = 'next7Days';
}
