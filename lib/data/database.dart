import 'package:hive/hive.dart';

class ToDoDataBase {

  List tasks = [];
  // refrence the box

  final _myBox = Hive.box('mytodobox');

  // run this method if this app running for the very first time ever 
  void createInitialData(){
    tasks = [
      ["Make tutorial",false],
      ["do exersise,", false]
    ];

  }
    // load data from the database
    void loadData(){
      tasks = _myBox.get("TODOLIST");
    }

    // update the database
    void updateDataBase(){
      _myBox.put("TODOLIST", tasks);
    }
}