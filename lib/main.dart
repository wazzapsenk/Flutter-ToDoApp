import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutter/cubit/homepage_cubit.dart';
import 'package:todoapp_flutter/cubit/todo_details_cubit.dart';
import 'package:todoapp_flutter/cubit/todo_record_cubit.dart';
import 'package:todoapp_flutter/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomepageCubit()),
        BlocProvider(create: (context)=>ToDoRecordCubit()),
        BlocProvider(create: (context)=>ToDoDetailsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo App',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.black45,
          ),
        ),
        home: const Homepage(),
      ),

    );
  }
}
