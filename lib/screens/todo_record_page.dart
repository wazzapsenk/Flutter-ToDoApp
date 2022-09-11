import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutter/cubit/todo_record_cubit.dart';

class ToDoRecordPage extends StatefulWidget {
  const ToDoRecordPage({Key? key}) : super(key: key);

  @override
  State<ToDoRecordPage> createState() => _ToDoRecordPageState();
}

class _ToDoRecordPageState extends State<ToDoRecordPage> {
  var tfToDoControl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Record"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfToDoControl,
              decoration: InputDecoration(hintText: "ToDo Name"),
              ),
              ElevatedButton(onPressed: (){
                context.read<ToDoRecordCubit>().record(tfToDoControl.text);
              }, child: const Text("SAVE")),
            ],
          ),
        ),
      ),
    );
  }
}
