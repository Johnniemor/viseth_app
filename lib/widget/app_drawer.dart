import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          ListTile(
            title: Text('title 1'),
          ),
          ListTile(
            title: Text('title 1'),
          ),
          ListTile(
            title: Text('title 1'),
          )
        ],
      ),
    );
  }
}
