import 'components/TaskCard.dart';
import 'package:flutter/material.dart';
import 'components/Task.dart';

List<Task> _compras = [Task("Comprar tomate", true)];
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
    TextEditingController nameController = TextEditingController();
    TextEditingController subnameController = TextEditingController();

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
                              _compras
                                  .add(Task(descricaoController.text, true));
                            });
                          },
                          child: Text("Adicionar")))
                ]),
                Expanded(
                  child: ListView.builder(
                    itemCount: _compras.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: TaskCard(_compras[index]),
                        onLongPress: () {
                          print(_compras[index].descricao);
                        },
                      );
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
