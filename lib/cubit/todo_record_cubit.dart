import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutter/repository/dao_repository.dart';

class ToDoRecordCubit extends Cubit<void>{
  ToDoRecordCubit():super(0);

  var todorepo=ToDoDaoRepository();

  Future<void> record(String todo_name) async{
    await todorepo.recordToDo(todo_name);
  }
}