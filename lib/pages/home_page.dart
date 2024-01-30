// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_flutter/component/dialog_box.dart';
import 'package:todo_flutter/component/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List tasks = [
    ["This is my first task", false],
    ["wt are u doing today", false],
    ["my name is abeniy", false],
  ];

  void checkBoxOnchange (bool? value,int index){
    setState(() {
      tasks[index][1] = !tasks[index][1]; 
    });
  }

  void saveTask(){
    setState(() {
      tasks.add([_controller.text,false]);
    });
    Navigator.of(context).pop();
  }

  void createNewTask(){
    showDialog(
      context: context,
     builder: (context){
      return DialogBox(
        controller: _controller,
        onCancel: ()=> Navigator.of(context).pop(),
        onSave: saveTask,
      );
     }
     
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: Center(
          child: Text(
            "TO DO ",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,
      backgroundColor: Colors.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50)
      ),
      child: Icon(Icons.add),
      
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context,index){
          return ToDoTile(
            taskCompleted: tasks[index][1],
            title: tasks[index][0],
            onChanged: (value) => checkBoxOnchange(value, index)
          );
        },
    )
    );
  }
}