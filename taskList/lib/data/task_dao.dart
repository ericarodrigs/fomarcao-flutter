import 'package:formacao_flutter/components/task_widget.dart';
import 'package:formacao_flutter/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task task) async {
    print('Iniciando o save');
    final Database database = await getDatabase();
    var itemExists = await find(task.title);
    Map<String, dynamic> taskMap = toMap(task);
    if (itemExists.isEmpty) {
      print('A tarefa nao existia.');
      return await database.insert(_tablename, taskMap);
    } else {
      print('A tarefa ja existia');
      return await database.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [task.title]);
    }
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll:');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tablename);
    print('Procurando dados no banco de dados... Encontrado: $result');
    return toList(result);
  }

  Future<List<Task>> find(String taskName) async {
    print(' Acessando o find: ');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database
        .query(_tablename, where: '$_name = ?', whereArgs: [taskName]);
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String taskName) async {
    print('Deletando tarefa: $taskName');
    final Database database = await getDatabase();
    return database.delete(_tablename, where: '$_name = ?', whereArgs: [taskName]);
  }

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    print('Convertendo to list:');
    final List<Task> tasks = [];
    for (Map<String, dynamic> line in taskMap) {
      final Task task = Task(
          title: line[_name],
          photo: line[_image],
          difficulty: line[_difficulty]);
      tasks.add(task);
    }
    print(' Lista de tarefas $tasks');
    return tasks;
  }

  Map<String, dynamic> toMap(Task task){
    print('Convertendo tarefa em Map: ');
    final Map<String, dynamic> taskMap = Map();
    taskMap[_name] = task.title;
    taskMap[_image] = task.photo;
    taskMap[_difficulty] = task.difficulty;
    print('Mapa de tarefas: $taskMap');
    return taskMap;
  }
}
