import 'package:flutter/material.dart';

import '../components/task_widget.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      appBar: AppBar(
        leading: Container(),
        centerTitle: false,
        title: const Text(
          'Tarefas',
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
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
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: opacity
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
      ),
    );
  }
}
