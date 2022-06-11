import 'package:flutter/material.dart';
import 'package:super_grid_view/super_grid_view.dart';
import 'package:super_grid_view/super_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SuperGridView(
        rowCount: 3,
        itemCount: 10,
        builder: (index) {
          return SuperTile(
            rowSize: 1,
            minHeight: 100,
            columnSize: index==0?2:1,
            child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(5),
                color: Colors.blue,
                child: Center(
                  child: Text("$index"),
                )),
          );
        },
      ),
    );
  }
}
