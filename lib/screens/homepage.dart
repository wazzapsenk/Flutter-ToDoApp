import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutter/cubit/homepage_cubit.dart';
import 'package:todoapp_flutter/model/todos.dart';
import 'package:todoapp_flutter/screens/todo_details_page.dart';
import 'package:todoapp_flutter/screens/todo_record_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isSearch=false;
  @override
  void initState() {
    super.initState();
    context.read<HomepageCubit>().getToDo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch ?
        TextField(decoration: const InputDecoration(hintText: "Search"),
        onChanged: (searchResult){
          context.read<HomepageCubit>().search(searchResult);
        },) : const Text("ToDo's"),
        actions: [
          isSearch ?
          IconButton(onPressed: () {
            setState((){isSearch= false;});
            context.read<HomepageCubit>().getToDo();
          }, icon: Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState((){isSearch=true;});
          }, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: BlocBuilder<HomepageCubit,List<ToDos>>(
        builder: (context, todoList) {
          if (todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, indeks) {
                var todo = todoList[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ToDoDetailsPage(
                              todo: todo,
                            ))).then((value){
                      context.read<HomepageCubit>().getToDo();
                    });
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${todo.todo_name}"),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                      "${todo.todo_name} delete?"
                                  ),
                                  action: SnackBarAction(label: "Evet", onPressed: (){
                                    context.read<HomepageCubit>().delete(todo.todo_id);
                                  })));
                            },
                            icon: Icon(Icons.delete_outline_outlined,color: Colors.black54,))
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ToDoRecordPage())).then((value) {
            context.read<HomepageCubit>().getToDo();
          });
        },
        child:const Icon(Icons.add),
      ),

    );
  }
}
