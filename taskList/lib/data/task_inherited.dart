import 'package:flutter/material.dart';
import 'package:formacao_flutter/components/task_widget.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task(
      title: 'Aprender Flutter',
      photo: 'assets/images/dash.png',
      difficulty: 3,
    ),
    Task(
      title: 'Andar de bike',
      photo: 'assets/images/bike.webp',
      difficulty: 2,
    ),
    Task(
      title: 'Meditar',
      photo: 'assets/images/meditation.jpeg',
      difficulty: 5,
    ),
    Task(
      title: 'Ler',
      photo: 'assets/images/book.jpeg',
      difficulty: 4,
    ),
    Task(
      title: 'Jogar',
      photo: 'assets/images/kako.jpeg',
      difficulty: 1,
    ),
  ];

  void newTask(String title, String photo, int difficulty){
    taskList.add(Task(title: title, photo: photo, difficulty: difficulty,));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
