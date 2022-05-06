import 'dart:ffi' as ffi;

import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:familytasks/google/protobuf/timestamp.pb.dart';
import 'package:familytasks/tasklistitem.dart';
import 'package:familytasks/tasksdto.pbgrpc.dart';

import 'mainscaffold.dart';
import 'package:intl/intl.dart';

// import 'package:alice/alice.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  int _counter = 0;
  List<TaskResponse> tasks = [];
  late ClientChannel channel;
  late TasksServiceClient stub;
  bool hideCancelled = true;
  bool hideDone = true;

  Future<void> _loadData() async {
    final req = ListTasksRequest(iD: 0);

    ListTasksResponse response = ListTasksResponse();
    try {
      response = await stub.listTasks(req);

      tasks = response.tasks
          .where((i) => hideCancelled
              ? (i.status != TaskResponse_STATUS.CANCELLED)
              : true)
          .toList();
      tasks.sort((a, b) =>
          a.due.seconds.compareTo(b.due.seconds)); //.map((e) => e.toList();
      //tasks = response.tasks;

    } catch (e) {
      print('Caught error: $e');
    }

    setState(() {
      //tasks = response.tasks;
    });
  }

  @override
  void initState() {
    channel = GrpcOrGrpcWebClientChannel.toSeparatePorts(
      grpcPort: 50004,
      grpcWebPort: 50005,
      host: 'tasks.armimema.be',
      //host: '35.192.158.227',
      //host: '127.0.0.1',
      grpcTransportSecure: false,
      grpcWebTransportSecure: false,
      //options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    stub = TasksServiceClient(channel);
    _loadData();
    super.initState();
  }

  Future<void> refresh(TaskResponse task, String title, String detail,
      DateTime due, String executor, String status) async {
    task.task = title;
    task.detail = detail;
    task.due = Timestamp.fromDateTime(due);
    task.executor = executor;
    task.status =
        TaskResponse_STATUS.values.where((x) => x.name == status).first;
    await stub.saveTask(task);
    await _loadData();
    setState(() {});
  }

  Future<void> addTask() async {
    TaskResponse task = TaskResponse(
        iD: 0,
        task: "New",
        status: TaskResponse_STATUS.NEW,
        at: Timestamp.fromDateTime(DateTime.now()),
        due: Timestamp.fromDateTime(new DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day)),
        owner: "app",
        executor: "Arend");
    await _displayTextInputDialog(context, task);
  }

  TextEditingController _textFieldController = TextEditingController();
  TextEditingController _textDetailController = TextEditingController();

  Future<void> _setDateTime(BuildContext context, TaskResponse task) async {
    var date = await _selectDate(context, task.due.toDateTime().toLocal());
    if (date != null) {
      var time = await _selectTime(context, task.due.toDateTime().toLocal());

      var dt = DateTime(date.year, date.month, date.day)
          .add(Duration(hours: time?.hour ?? 0, minutes: time?.minute ?? 0));

      print(dt);
    }
  }

  Future<void> _displayTextInputDialog(
      BuildContext context, TaskResponse task) async {
    String userDropdownValue = "Arend";
    String statusDropdownValue = "NEW";
    String date = "";
    String selectedDateString = "";
    String selectedTimeString = "";
    DateTime selectedDateTime = DateTime.now();

    _textFieldController.text = task.task;
    _textDetailController.text = task.detail;
    userDropdownValue = task.executor;
    selectedDateTime = task.due.toDateTime().toLocal();
    selectedDateString = DateFormat('yyyy-MM-dd').format(selectedDateTime);
    selectedTimeString = DateFormat('HH:mm').format(selectedDateTime);
    statusDropdownValue = task.status.toString();

    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              alignment: Alignment.center,
              title: const Text("Edit task",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Text("Title",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const Divider(color: Colors.black),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextField(
                          controller: _textFieldController,
                        )),
                    const Text("Detail",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const Divider(color: Colors.black),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextField(
                          controller: _textDetailController,
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: const Text("User",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Divider(color: Colors.black),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: DropdownButton<String>(
                          value: userDropdownValue,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          //style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              userDropdownValue = newValue!;
                            });
                          },
                          items: <String>['Arend', 'Emrys', 'Kiren', 'Mireille']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Status",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Divider(color: Colors.black),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: DropdownButton<String>(
                          value: statusDropdownValue,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          //style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(height: 2),
                          onChanged: (String? newValue) {
                            setState(() {
                              statusDropdownValue = newValue!;
                            });
                          },
                          items: <String>['NEW', 'ACTIVE', 'DONE', 'CANCELLED']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Todo before",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Divider(color: Colors.black),
                    Row(children: [
                      Container(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextButton(
                              onPressed: () async {
                                var dt = await _selectDate(
                                    context, selectedDateTime);
                                if (dt != null && dt != selectedDateTime) {
                                  setState(() {
                                    selectedDateTime = dt;
                                    selectedDateString =
                                        DateFormat('yyyy-MM-dd')
                                            .format(selectedDateTime);
                                    selectedTimeString = DateFormat('kk:mm')
                                        .format(selectedDateTime);
                                  });
                                }
                              },
                              child: Text(
                                selectedDateString,
                                style: const TextStyle(color: Colors.blue),
                              ))),
                      Container(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextButton(
                              onPressed: () async {
                                var dt = await _selectTime(
                                    context, selectedDateTime);
                                if (dt != null && dt != selectedDateTime) {
                                  setState(() {
                                    selectedDateTime = dt;
                                    selectedDateString =
                                        DateFormat('yyyy-MM-dd')
                                            .format(selectedDateTime);
                                    selectedTimeString = DateFormat('kk:mm')
                                        .format(selectedDateTime);
                                  });
                                }
                              },
                              child: Text(
                                selectedTimeString,
                                style: const TextStyle(color: Colors.blue),
                              ))),
                      Container(height: 50.0)
                    ]),
                  ]),
              actions: <Widget>[
                OutlinedButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                OutlinedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    setState(() {
                      // task.task = _textFieldController.text;
                      // task.detail = _testDetailController.test;
                      //widget.notifyParent
                      refresh(
                          task,
                          _textFieldController.text,
                          _textDetailController.text,
                          selectedDateTime,
                          userDropdownValue,
                          statusDropdownValue);
                    });

                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
        });
  }

  Future<DateTime?> _selectDate(
      BuildContext context, DateTime selectedDateTime) async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );

    TimeOfDay? tod =
        TimeOfDay(hour: selectedDateTime.hour, minute: selectedDateTime.minute);

    return selected?.add(Duration(hours: tod.hour, minutes: tod.minute));
  }

  Future<DateTime?> _selectTime(
      BuildContext context, DateTime selectedDateTime) async {
    TimeOfDay? tod = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: selectedDateTime.hour, minute: selectedDateTime.minute));

    return DateTime(
            selectedDateTime.year, selectedDateTime.month, selectedDateTime.day)
        .add(Duration(hours: tod?.hour ?? 0, minutes: tod?.minute ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appBar: AppBar(
          title: Align(alignment: Alignment.center, child: Text(widget.title)),
        ),
        body: Center(
          child: Container(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                    itemBuilder: (BuildContext, index) {
                      return TaskListItem(
                          task: tasks[index],
                          notifyParent: refresh,
                          openDialog: _displayTextInputDialog,
                          setDateTime: _setDateTime);
                    },
                    itemCount: tasks.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 50),
                    scrollDirection: Axis.vertical,
                  ))),
        ),
        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 50.0,
              child: Row(children: [
                Checkbox(
                  value: hideCancelled,

                  //rint("set state")
                  onChanged: (bool? value) {
                    setState(() {
                      hideCancelled = value!;
                      _loadData();
                    });
                  },
                ),
                Text("hide cancelled")
              ]),
            )),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          SizedBox(width: 50),
          FloatingActionButton(
              onPressed: () => {addTask()},
              tooltip: 'Add task',
              child: const Icon(Icons.add)),
          // FloatingActionButton(
          //     onPressed: () => {_loadData()},
          //     tooltip: 'Refresh',
          //     child: const Icon(Icons.refresh))
        ]));
  }
}
