import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutter/repository/dao_repository.dart';

class ToDoDetailsCubit extends Cubit<void>{
  ToDoDetailsCubit():super(0);
  var todorepo=ToDoDaoRepository();

  Future<void> update(String todo_name, int todo_id) async {
    await todorepo.updateToDo(todo_name, todo_id);
  }
}