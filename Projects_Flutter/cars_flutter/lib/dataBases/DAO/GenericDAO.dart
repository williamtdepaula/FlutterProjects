import 'dart:async';

import 'package:cars_flutter/models/Entity.dart';

import '../dbHelper.dart';
import 'package:sqflite/sqflite.dart';

// Data Access Object
abstract class GenericDAO<T extends Entity> {
  Future<Database> get db => DatabaseHelper.getInstance().db;

  String get nameTable;

  T fromJson(Map<String, dynamic> map);

  Future<int> save(T entity) async {
    var dbClient = await db;
    var id = await dbClient.insert(nameTable, entity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('id: $id');
    return id;
  }

  Future<List<T>> findAll() async {
    return await this.query('select * from $nameTable');
  }

  Future<List<T>> query(String sql, [List<dynamic> arguments]) async {
    final dbClient = await db;

    final list = await dbClient.rawQuery(sql, arguments);

    return list.map<T>((json) => fromJson(json)).toList();
  }

  Future<T> findById(int id) async {
    final list =
        await this.query('select * from $nameTable where id = ?', [id]);

    if (list.length > 0) {
      return list.first;
    }

    return null;
  }

  Future<bool> exists(int id) async {
    T c = await findById(id);
    var exists = c != null;
    return exists;
  }

  Future<int> count() async {
    return (await this.query('select count(*) from $nameTable')).length;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient
        .rawDelete('delete from $nameTable where id = ?', [id]);
  }

  Future<int> deleteAll() async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from $nameTable');
  }
}
