// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_flutter/component/dialog_box.dart';
import 'package:todo_flutter/component/todo_tile.dart';
import 'package:todo_flutter/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box('mytodobox');
  // instansiate the db
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if the first opening set default data 

    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    
  }else{
    // there is already a data
    db.loadData();
  }
    super.initState();
  }
  // text controller 
  final _controller = TextEditingController();


  void checkBoxOnchange (bool? value,int index){
    setState(() {
      db.tasks[index][1] = !db.tasks[index][1]; 
    });
    db.updateDataBase();
  }

  void saveTask(){
    setState(() {
      db.tasks.add([_controller.text,false]);
    });
    Navigator.of(context).pop();
    db.updateDataBase();
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

  void deleteTodo(int index){
    setState(() {
      db.tasks.removeAt(index);
    });
    db.updateDataBase();
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
        itemCount: db.tasks.length,
        itemBuilder: (context,index){
          return ToDoTile(
            taskCompleted: db.tasks[index][1],
            title: db.tasks[index][0],
            onChanged: (value) => checkBoxOnchange(value, index),
            deleteTask: (context)=> deleteTodo(index),
          );
        },
    )
    );
  }
}