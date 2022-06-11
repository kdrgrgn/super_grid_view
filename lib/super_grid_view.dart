library super_grid_view;

import 'package:flutter/material.dart';
import 'package:super_grid_view/super_tile.dart';

class SuperGridView extends StatelessWidget {
  int rowCount;
  int itemCount;
  SuperTile Function(int index) builder;
  ScrollController? controller;
  ScrollPhysics? physics;

  SuperGridView({
    //   required this.columnCount,
    required this.rowCount,
    required this.itemCount,
    required this.builder,
    this.controller,
    this.physics,
    Key? key,
  }) : super(key: key);

  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: controller,
        physics: physics,
        child: Row(
          children: List.generate(rowCount, (rowIndex) {
            return Column(
              children: List.generate((itemCount ~/ rowCount), (index) {
                currentIndex+=1;
                return _BuildSuperTile(
                    rowCount: rowCount, tile: builder(currentIndex));
              }),
            );
          }),
        ));
  }
}

//  Wrap(
//         children: List.generate(itemCount, (index) {
//           if(builder(index).columnSize>1){

//           }
//           return _BuildSuperTile(
//               rowCount: rowCount,
//               tile: builder(index));
//         }),
//       ),
class _BuildSuperTile extends StatelessWidget {
  // int columnCount;
  int rowCount;
  SuperTile tile;
  _BuildSuperTile(
      {
      //   required this.columnCount,
      required this.rowCount,
      required this.tile,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(tile.rowSize < rowCount, "Yuhh o kadar buyuk olamaz!!!!");

    return SuperTile(
      columnSize: tile.columnSize,
      rowSize: tile.rowSize,
      child: SizedBox(
        width: (MediaQuery.of(context).size.width / rowCount) * tile.rowSize,
        height: tile.minHeight != null
            ? (tile.minHeight! * tile.columnSize)
            : (MediaQuery.of(context).size.width / rowCount) * tile.columnSize,
        child: tile.child,
      ),
    );
  }
}
