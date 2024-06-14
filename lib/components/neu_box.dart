import 'package:flutter/material.dart';

class NeuBox extends StatefulWidget {
  final Widget? child;
   

   NeuBox({super.key, this.child, });

  @override
  State<NeuBox> createState() => _NeuBoxState();
}

class _NeuBoxState extends State<NeuBox> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          //darker shadow on bottom right
            BoxShadow(color: Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(4,4),
            ),
          //lighter sahdow in top lef
           BoxShadow(color:  Theme.of(context).colorScheme.error,
            blurRadius: 15,
            offset: Offset(-4,-4),
            ),
           
        ]
      ),
      // padding: const EdgeInsets.all(12),
      child: widget.child,
    );
    
  }
}