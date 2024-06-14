import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_beats/themes/theme_provider.dart';
import 'package:provider/provider.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  bool apptheme=false;
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
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 50,
                      width: 60,
                      child: Image.asset('assets/music_icon.png')),
                   Text(
                    'PC BEATS',
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color:Theme.of(context).colorScheme.inversePrimary
                        ),
                  ),
                ],
              ),
            ),
          ),

          //home tile
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListTile(
              tileColor: Theme.of(context).colorScheme.surface,
              title:  Text(
                'H O M E',
                style: TextStyle(fontSize: 15, color:Theme.of(context).colorScheme.inversePrimary),
              ),
              leading:  Icon(
                Icons.home_filled,
                size: 25,
                color:Theme.of(context).colorScheme.inversePrimary
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          //Theme button
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListTile(
              tileColor: Theme.of(context).colorScheme.surface,
              title:  Text(
                apptheme?'L I G H T  M O D E':'D A R K  M O D E',
                style: TextStyle(fontSize: 15,color:Theme.of(context).colorScheme.inversePrimary),
              ),
              leading:  Icon(
                Icons.dark_mode,
                size: 25,
                color:Theme.of(context).colorScheme.inversePrimary
              ),
              trailing: Switch(
                value: Provider.of<ThemeProvider>(context, listen: false)
                    .isDarkMode,
                onChanged: ( value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                      setState(() {
                        apptheme=!apptheme;
                      });
                },
              
              ),
            ),
          ),
          //settings tile
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListTile(
              tileColor: Theme.of(context).colorScheme.surface,
              title:  Text(
                'S E T T I N G S',
                style: TextStyle(fontSize: 15, color:Theme.of(context).colorScheme.inversePrimary ),
              ),
              leading:  Icon(
                Icons.settings,
                size: 25,
                color:Theme.of(context).colorScheme.inversePrimary
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
