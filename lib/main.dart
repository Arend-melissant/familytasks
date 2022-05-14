//import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:developer' as developer;

//import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:familytasks/tasklistitem.dart';
import 'package:familytasks/tasksdto.pbgrpc.dart';
import 'package:familytasks/todopage.dart';

// import 'package:alice/alice.dart';

void main() {


  runApp(FamilyTasks());
}

class FamilyTasks extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<FamilyTasks> {
  //late Alice _alice;

  // @override
  // void initState() {
  //   _alice = Alice(
  //     showNotification: true,
  //     showInspectorOnShake: true,
  //     darkTheme: false,
  //     maxCallsCount: 1000,
  //   );
  //   super.initState();
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    developer.log("start application");

    return MaterialApp(
      title: 'Family Tasks',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //navigatorKey: _alice.getNavigatorKey(),
      home: ToDoPage(title: 'Family tasks lists'),
    );
  }

  // void _runHttpInspector() {
  //   _alice.showInspector();
  // }
}
