import 'package:flutter/material.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //logo
          DrawerHeader(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                 Container(
                  height: 50,
                  width: 60,
                  child: Image.asset('assets/music_icon.png')),
                  Text('PC BEATS', style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 25, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),

          //home tile
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListTile(
              tileColor: Theme.of(context).colorScheme.surface,
              title: Text('H O M E', style: TextStyle(fontSize: 20),),
              leading: Icon(Icons.home_filled, size: 25,),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          //settings tile
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListTile(
              tileColor: Theme.of(context).colorScheme.surface,
              title: Text('S E T T I N G S', style: TextStyle(fontSize: 20),),
              leading: Icon(Icons.settings, size: 25,),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),),);
              },
            ),
          )
        ],
      ),
    );
  }
}
