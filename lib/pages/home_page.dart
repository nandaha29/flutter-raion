import 'package:flutter/material.dart';
import 'package:listpagedua/util/dialog_box.dart';
import 'package:listpagedua/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controllers
  final _taskController = TextEditingController();
  final _timeController = TextEditingController();
  final _descController = TextEditingController();

  // TimeOfDay time = TimeOfDay(hour: 10, minute: 30);

  // makelist to do tasks
  List toDoList = [
    [
      false,
      "Kalkulus",
      "10.00 PM ~ 11 April 2023",
      "Mengerjakan Latihan 1 di Google Classroom"
    ],
    [
      false,
      "PBO",
      "02.30 PM ~ 11 April 2023",
      "Mengerjakan study case di Eling"
    ],
  ];

  // chekbox ws tapped
  void checkBoxChange(bool? value, int index) {
    //buat state untuk update
    setState(() {
      toDoList[index][0] = !toDoList[index][0];
    });
  }

  //save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([
        false,
        _taskController.text,
        _timeController.text,
        _descController.text,
      ]);
      _taskController.clear();
      _timeController.clear();
      _descController.clear();
    });
    Navigator.of(context).pop();
  }

  // create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          taskController: _taskController,
          timeController: _timeController,
          descController: _descController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('MY TO DO'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][1],
            timeName: toDoList[index][2],
            descName: toDoList[index][3],
            taskCompleted: toDoList[index][0],
            onChanged: (value) => checkBoxChange(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
