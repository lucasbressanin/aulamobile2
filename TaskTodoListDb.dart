import 'components/TaskCard.dart';
import 'repository/TaskDataBase.dart';
import 'package:flutter/material.dart';
import 'components/Task.dart';

// List<Task> _tasks = [Task("Comprar tomate", false)];

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final title = 'Todo List';
    TextEditingController descricaoController = TextEditingController();

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                      flex: 2,
                      child: TextField(
                        controller: descricaoController,
                      )),
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              TaskDataBase.salvar(
                                  Task(descricaoController.text, true));
                              // _tasks.add(Task(descricaoController.text, true));
                            });
                          },
                          child: Text("Adicionar")))
                ]),
                Expanded(
                  child: FutureBuilder(
                    future: TaskDataBase.listTask(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: TaskCard(snapshot.data[index]),
                              onLongPress: () {
                                setState(() {
                                  // _tasks[index].enable = false;
                                });
                              },
                            );
                          });
                    },
                  ),
                  /*
                  child: ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: TaskCard(_tasks[index]),
                        onLongPress: () {
                          setState(() {
                            _tasks[index].enable = false;
                          });
                        },
                      );
                    },
                  ),
                  */
                )
              ],
            )),
      ),
    );
  }
}
