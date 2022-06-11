import 'package:flutter/material.dart';



class SuperTile extends StatelessWidget {
  int rowSize;
  int columnSize;
  Widget child;
    double ?minHeight;

  SuperTile({required this.rowSize, required this.columnSize,required this.child, this.minHeight, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
