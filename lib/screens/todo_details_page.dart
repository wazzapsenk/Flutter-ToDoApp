import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutter/cubit/todo_details_cubit.dart';
import 'package:todoapp_flutter/model/todos.dart';

class ToDoDetailsPage extends StatefulWidget {
  ToDos todo;


  ToDoDetailsPage({required this.todo});

  @override
  State<ToDoDetailsPage> createState() => _ToDoDetailsPageState();
}

class _ToDoDetailsPageState extends State<ToDoDetailsPage> {
  var tfToDoControl=TextEditingController();
  @override
  void initState() {
    
    super.initState();
    var todo=widget.todo;
    tfToDoControl.text=todo.todo_name;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo Details"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfToDoControl,decoration: InputDecoration(hintText: tfToDoControl.text),),
              ElevatedButton(onPressed: (){
                context.read<ToDoDetailsCubit>().update(tfToDoControl.text, widget.todo.todo_id);
              }, child: const Text("UPDATE")),
            ],
          ),
        ),
      ),
    );
  }
}
