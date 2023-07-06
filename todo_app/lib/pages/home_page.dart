import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List todoList = [
    ["Make Todo List", false],
    ["Learn Dijkstra's Algo", false]
  ];

  void checkBoxChanged(bool? value, int index){
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            'TO DO',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value){
              checkBoxChanged(value,index);
            },
          );
        },
      ),
    );
  }
}
