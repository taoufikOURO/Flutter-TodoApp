import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_todolist_app/utils/todo_list.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Creer le controlleur
  final _controller = TextEditingController();

  List TodoList = [
    ['Apprendre Dart', false],
    ['Apprendre Flutter', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      TodoList[index][1] = !TodoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      TodoList.add([_controller.text, false]);
    });
  }

  void deletetask(int index) {
    setState(() {
      TodoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold, c'est toute la page de notre application sans l' AppBar
      //Pour donner un background color de ma page
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Liste des taches",
          ),
        ),
        backgroundColor: Colors.deepPurple, //Pour la couleur d'arriere plan
        foregroundColor: Colors.white, //Pour la couleur du texte
      ),
      //On passe maintenant au body de ma page
      body: ListView.builder(
          itemCount: TodoList.length,
          itemBuilder: (BuildContext context, index) {
            const EdgeInsets.all(15);
            //Todo est une classe externe
            return todo(
              taskName: TodoList[index][0],
              taskCompleted: TodoList[index][1],
              onChanged: (value) => checkBoxChanged(index),
              deleteFunction: (value) => deletetask(index),
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextField(
                  //recuperer la saisie de l'utilisateur
                  controller: _controller,

                  decoration: InputDecoration(
                      hintText: "Ajouter une tache",
                      filled: true,
                      fillColor: Colors.deepPurple.shade200,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
