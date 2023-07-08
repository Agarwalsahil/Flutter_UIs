import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List todoList = [];

  //reference our box
  final _myBox = Hive.box('mybox');

  // run the method if first time ever the app is opened
  void createInitialData(){
    todoList = [
      ["Make tutorial", false],
      ["Give contest", false]
    ];
  }

  //load the data from database

  void loadDataBase(){
    todoList  = _myBox.get("TODOLIST");
  }

  //update the data in the database

  void updateDataBase(){
    _myBox.put("TODOLIST", todoList);
  }


}