//import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:familytasks/tasksdto.pb.dart';
import 'package:intl/intl.dart';
import 'package:familytasks/tasksdto.pbenum.dart';
import 'package:familytasks/google/protobuf/timestamp.pb.dart';

class TaskListItem extends StatefulWidget {
  TaskListItem(
      {required this.task,
      required this.notifyParent,
      required this.openDialog,
      Key? key})
      : super(key: key);
  final TaskResponse task;
  final Function(TaskResponse, String, DateTime, String, String) notifyParent;
  final Function(BuildContext context, TaskResponse task) openDialog;

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  IconData GetIcon(TaskResponse task) {
    IconData result = Icons.device_unknown;
    switch (task.status) {
      case TaskResponse_STATUS.NEW:
        result = Icons.new_releases_outlined;
        break;
      case TaskResponse_STATUS.ACTIVE:
        result = Icons.access_alarm_rounded;
        break;
      case TaskResponse_STATUS.CANCELLED:
        result = Icons.cancel;
        break;
      case TaskResponse_STATUS.DONE:
        result = Icons.done;
        break;
    }
    return result;
  }

  FontStyle GetFontStyle(TaskResponse task) {
    FontStyle result = FontStyle.normal;
    switch (task.status) {
      case TaskResponse_STATUS.NEW:
        result = FontStyle.normal;
        break;
      case TaskResponse_STATUS.ACTIVE:
        result = FontStyle.normal;
        break;
      case TaskResponse_STATUS.CANCELLED:
        result = FontStyle.italic;
        break;
      case TaskResponse_STATUS.DONE:
        result = FontStyle.normal;
        break;
    }
    return result;
  }

  TextDecoration GetTextDecoration(TaskResponse task) {
    TextDecoration result = TextDecoration.none;
    switch (task.status) {
      case TaskResponse_STATUS.NEW:
        result = TextDecoration.none;
        break;
      case TaskResponse_STATUS.ACTIVE:
        result = TextDecoration.none;
        break;
      case TaskResponse_STATUS.CANCELLED:
        result = TextDecoration.lineThrough;
        break;
      case TaskResponse_STATUS.DONE:
        result = TextDecoration.none;
        break;
    }
    return result;
  }

  Future<void> setStatus(TaskResponse task) async {
    String result = "UNKNOWN";
    switch (task.status) {
      case TaskResponse_STATUS.NEW:
        result = "ACTIVE";
        break;
      case TaskResponse_STATUS.ACTIVE:
        result = "DONE";
        break;
      case TaskResponse_STATUS.CANCELLED:
        result = "NEW";
        break;
      case TaskResponse_STATUS.DONE:
        result = "NEW";
        break;
    }

    widget.notifyParent(
        task,
        task.task,
        DateTime.fromMillisecondsSinceEpoch(task.due.seconds.toInt() * 1000),
        task.executor,
        result);
  }

  String GetDateString(int seconds) {
    final f = DateFormat('yyyy-MM-dd HH:mm');
    var date = DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
    return f.format(date);
  }

  int hoverId = -1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.openDialog(context, widget.task);
        },
        child: MouseRegion(
            onEnter: (PointerEvent details) => {
                  //appContainer.style.cursor='pointer';
                  setState(() => hoverId = widget.task.iD)
                },
            onExit: (PointerEvent details) => {setState(() => hoverId = -1)},
            child: Card(
              child: ListTile(
                trailing: IconButton(
                  splashRadius: 12,
                  icon: Icon(GetIcon(widget.task)),
                  hoverColor: Color(0x80FF0000),
                  onPressed: () {
                    setState(() {
                      setStatus(widget.task);
                    });
                  },
                ),

                title: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(widget.task.task,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: widget.task.iD == hoverId
                                ? Color(0x80FF0000)
                                : Color(0x80000000),
                            fontStyle: GetFontStyle(widget.task),
                            decoration: GetTextDecoration(widget.task))),
                  ),
                ),

                subtitle: Align(
                    alignment: Alignment.center,
                    child: Column(children: [
                      Text(
                          "due: " +
                              GetDateString(widget.task.due.seconds.toInt()) +
                              " [" +
                              widget.task.executor +
                              "]",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      const Text(
                          "subtitle die wat langer is dan we zouden verwachten",
                          maxLines: 2),
                    ])),

                // onTap: () {
                //   _displayTextInputDialog(context, widget.task);
                // },
              ),
            )));
  }
}
