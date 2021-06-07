import '../components/Task.dart';
import 'package:path/path.dart';
import '/sqflite/sqflite.dart';

class TaskDataBase {
  static final TaskDataBase _singleton = new TaskDataBase();

  factory TaskDataBase() {
    return _singleton;
  }

  static _dataBaseManager() async {
    final int versiondb = 1;
    final pathDatabase = await getDatabasesPath();
    final localDatabase = join(pathDatabase, "todolist.db");
    var bd = await openDatabase(localDatabase, version: versiondb,
        onCreate: (db, versiondb) {
      String sql =
          "create table task(id integer primary key, descricao varchar, enable integer)";
      db.execute(sql);
    });
    return bd;
  }

  static salvar(Task task) async {
    Database bd = await _dataBaseManager();
    Map<String, dynamic> dadosTask = {
      "descricao": task.descricao,
      "enable": 1,
    };
    int id = await bd.insert("task", dadosTask);
    print("Salvo:  $id");
  }

  static Future listTask() async {
    Database bd = await _dataBaseManager();
    List listaTasks = await bd.rawQuery("select * from task");
    var _tasks = new List();
    for (var item in listaTasks) {
      var task =
          new Task(item['descricao'], item['enable'] == 1 ? true : false);
      task.id = item['id'];
      _tasks.add(task);
    }
    return _tasks;
  }

  static disableTask(Task task) async {
    Database bd = await _dataBaseManager();
    Map<String, dynamic> dadosTask = {
      "descricao": task.descricao,
      "enable": 0,
    };
    bd.update("task", dadosTask, where: "id = ?", whereArgs: [task.id]);
  }
}
