import 'package:flutter/material.dart';
import 'package:todolist/dialog.dart';
import 'package:todolist/todorow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override 
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final _controller = TextEditingController();

List toDoList = [
["Delete this row", false],
["Uncheck this box", true],

];


void checkBox(bool? value, int index) {
 setState(() {
   toDoList[index][1] = !toDoList[index][1];
 });
}

void saveTask (){
  setState(() {
    toDoList.add([_controller.text, false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
}

void createTask() {
  showDialog(context: context, 
  builder: (context) {
return DialogBox(
  controller: _controller,
  save: saveTask,
  cancel: () => Navigator.of(context).pop(),
      );
    }
  );
}

void deleteTask (int index){
  setState(() {
    toDoList.removeAt(index);
  });
}
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('TO DO'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder:(context, index) {
          return ToDoRow(
            nameTask: toDoList[index][0], 
            completeTask: toDoList[index][1], 
            onChanged: (value) => checkBox(value, index),
            deleteFunction: (context) => deleteTask(index),
            );
        },    
      ),
    );
  }
}
 