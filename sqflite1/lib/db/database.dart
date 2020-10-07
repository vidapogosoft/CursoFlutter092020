import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite1/model/client_model.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';

class ClientDatabaseProvider {
  ClientDatabaseProvider._();

  static final ClientDatabaseProvider db = ClientDatabaseProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "client.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Client ("
          "id integer primary key,"
          "name TEXT,"
          "phone TEXT"
          ")");
    });
  }

//query

//muestra todos los registros

  Future<List<Cliente>> getAllClients() async {
    final db = await database;
    var response = await db.query("Client");
    List<Cliente> list = response.map((c) => Cliente.fromMap(c)).toList();
    return list;
  }

  Future<Cliente> getClienteById(int id) async {
    final db = await database;
    var response = await db.query("Client", where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty ? Cliente.fromMap(response.first) : null;
  }

  //Insert
  addClienteToDatabase(Cliente newcliente) async {
    final db = await database;

    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");

    int id = table.first["id"];

    newcliente.id = id;

    var raw = await db.insert("Client", newcliente.tomap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    return raw;
  }

//Delete all clientes
  deleteAllClient() async {
    final db = await database;
    db.delete("Client");
  }

  //Update by Id
  updateClient(Cliente updclient) async {
    final db = await database;
    var response = await db.update("Client", updclient.tomap(),
        where: "id = ?", whereArgs: [updclient.id]);
    return response;
  }
}
