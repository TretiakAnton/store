import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:store/core/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: primary,
            ),
            child: const Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log out'),
            onTap: () {
              context.router.pop();
            },
          ),
        ],
      ),
    );
  }
}
