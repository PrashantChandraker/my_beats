import 'package:flutter/material.dart';
import 'package:my_beats/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class NeuBox extends StatefulWidget {
  final Widget? child;

  NeuBox({
    super.key,
    this.child,
  });

  @override
  State<NeuBox> createState() => _NeuBoxState();
}

class _NeuBoxState extends State<NeuBox> {
  @override
  Widget build(BuildContext context) {

    // is dark mode
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            //darker shadow on bottom right
            BoxShadow(
              color:isDarkMode? Colors.black :  Colors.grey.shade500,
              blurRadius: isDarkMode ? 5: 15,
              offset: const Offset(4, 4),
            ),
            //lighter sahdow in top left
            BoxShadow(
              color: isDarkMode?Colors.grey.shade900: Colors.white,
              blurRadius:  isDarkMode ? 5: 15,
              offset: Offset(-4, -4),
            ),
          ]),
      // padding: const EdgeInsets.all(12),
      child: widget.child,
    );
  }
}
