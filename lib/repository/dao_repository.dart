import 'package:todoapp_flutter/model/todos.dart';
import 'package:todoapp_flutter/sqlite/database_component.dart';

class ToDoDaoRepository{

  Future<List<ToDos>> getAllToDo() async {
    var db=await DatabaseComponent.dbAccess();
    List<Map<String,dynamic>> maps=await db.rawQuery("Select * FROM todo_db");
    return List.generate(maps.length, (index){
      var line=maps[index];
      return ToDos(todo_id: line["todo_id"], todo_name: line["todo_name"]);
    });
  }

  Future<void> recordToDo(String todo_name) async{
    var db=await DatabaseComponent.dbAccess();
    var info=Map<String, dynamic>();
    info["todo_name"]=todo_name;
    await db.insert("todo_db", info);
  }

  Future<List<ToDos>> searchToDo(String searchKey) async {
    var db=await DatabaseComponent.dbAccess();
    List<Map<String,dynamic>> maps=await db.rawQuery("SELECT * FROM todo_db WHERE todo_name like '%$searchKey%'");
    return List.generate(maps.length, (index) {
      var line=maps[index];
      return ToDos(todo_id: line["todo_id"], todo_name: line["todo_name"]);
    });
  }

  Future<void> updateToDo(String todo_name,int todo_id) async {
    var db=await DatabaseComponent.dbAccess();
    var info=Map<String,dynamic>();
    info["todo_name"]=todo_name;
    await db.update("todo_db", info,where: "todo_id = ?", whereArgs: [todo_id]);
  }

  Future<void> deleteToDo(int todo_id) async{
    var db=await DatabaseComponent.dbAccess();
    await db.delete("todo_db",  where: "todo_id = ?",whereArgs: [todo_id]);
  }

}