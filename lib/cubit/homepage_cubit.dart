import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutter/model/todos.dart';
import 'package:todoapp_flutter/repository/dao_repository.dart';
class HomepageCubit extends Cubit<List<ToDos>>
{
  HomepageCubit():super(<ToDos>[]);
  var todorepo=ToDoDaoRepository();

  Future<void> getToDo() async{
    var list=await todorepo.getAllToDo();
    emit(list);
  }
  Future<void> search(String searchKey) async{
    var list =await todorepo.searchToDo(searchKey);
    emit(list);
  }
  Future<void> delete(int todo_id) async{
    await todorepo.deleteToDo(todo_id);
    await getToDo();
  }

}