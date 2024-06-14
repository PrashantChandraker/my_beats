import 'package:flutter/material.dart';
import 'package:my_beats/models.dart/playlist_provider.dart';
import 'package:my_beats/themes/light_mode.dart';
import 'package:my_beats/themes/theme_provider.dart';
import 'package:provider/provider.dart';

import 'pages/homepage.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=> ThemeProvider()),
      ChangeNotifierProvider(create: (context)=> PlayListProvider()),
    ],

  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
     
    );
  }
}
