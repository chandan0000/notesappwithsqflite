import 'dart:async';
import 'dart:io' as io;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friverpod/models/todo.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

final notesList = FutureProvider<List<Todo>>((ref) async {
  return ref.watch(notesDbProvider).getUserDetails();
});
final notesInsertion = FutureProvider.family<Todo, dynamic>((ref, todo) {
  return ref.watch(notesDbProvider).insert(todo);
});
final notesDbProvider = Provider<NotesDb>((ref) => NotesDb());

class NotesDb {
  static Database? _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'notes.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT,depscription TEXT NOT NULL,authname TEXT,time DATETIME DEFAULT CURRENT_TIMESTAMP)",
    );
  }

  Future<Todo> insert(Todo todo) async {
    var dbClient = await db;
    await dbClient.insert(
      'notes',
      todo.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return todo;
  }

  Future<List<Todo>> getUserDetails() async {
    var dbClient = await db;

    final List<Map<String, Object?>> queryResult =
        await dbClient.query('notes');

    return queryResult.map((e) => Todo.fromJson(e)).toList();
  }

  Future deleteTableContent() async {
    var dbClient = await db;
    return await dbClient.delete(
      'notes',
    );
  }

  Future<int> updateQuantity(Todo todo) async {
    var dbClient = await db;
    return await dbClient.update(
      'notes',
      todo.toJson(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
