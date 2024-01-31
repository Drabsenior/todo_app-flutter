// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatelessWidget {

  final bool taskCompleted;
  final String title;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

   ToDoTile({
    super.key,
    required this.taskCompleted,
    required this.title,
    required this.onChanged,
    required this.deleteTask
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4),topLeft: Radius.circular(4), bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12)
            ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
                 ),
              Text(
                title,
                style: TextStyle(
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
                ),
                
                ),
            ],
          ),
        ),
      ),
    );
  }
}