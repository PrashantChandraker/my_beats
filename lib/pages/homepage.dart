import 'package:flutter/material.dart';

import '../components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: const Text('P L A Y L I S T'),
      backgroundColor: Theme.of(context).colorScheme.primary,
      centerTitle: true,),
      drawer: const MyDrawer(),
    );
  }
}