import 'package:flutter/material.dart';

import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:familytasks/tasklistitem.dart';
import 'package:familytasks/tasksdto.pbgrpc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mainscaffold.dart';

// import 'package:alice/alice.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool hideCancelled = true;
  bool hideDone = true;

  _savePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('hideCancelled', hideCancelled?1:0);
    prefs.setInt('hideDone', hideDone?1:0);
  }

  _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      hideCancelled = (prefs.getInt('hideCancelled') ?? 0)==1;
      hideDone = (prefs.getInt('hideDone') ?? 0)==1;

    });
  }

@override   void initState() {
    //   WidgetsBinding.instance?.addPostFrameCallback((_){
    //   _loadPrefs();
    // });
    
    _loadPrefs();
    super.initState();
}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return WillPopScope(
          onWillPop: () async {
            print("going back");
            return Future.value(false); //Replace by your conditionals here. false means you're block back action for this page
          },
          child: MainScaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            }, // Handle your on tap here.
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Align(alignment: Alignment.center, child: Text(widget.title)),
        ),
        body: Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [
            Checkbox(
                  value: hideCancelled,

                  //rint("set state")
                  onChanged: (bool? value) {
                    setState(() {
                      hideCancelled = value!;
                      _savePrefs();
                    });
                  },
                ),
                Text("hide cancelled")
            ]),
            Row(children: [
            Checkbox(
                  value: hideDone,

                  //rint("set state")
                  onChanged: (bool? value) {
                    setState(() {
                      hideDone = value!;
                      _savePrefs();
                    });
                  },
                ),
                Text("hide done")
            ]),
        ],),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(height: 50.0),
        ),
        floatingActionButton: SizedBox.shrink()));
  }
}
