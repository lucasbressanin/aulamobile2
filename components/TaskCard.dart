import 'package:flutter/material.dart';
import 'Task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  TaskCard(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5, bottom: 5),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(this.task.descricao),
      ),
    );
  }
}
