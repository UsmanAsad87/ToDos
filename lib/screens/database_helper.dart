/*
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  static const _dbName = 'myDatabase.db';
  static const _dbVersion = 1;
  static const _tableName = "myTable";
  static const columnId='_id';
  static const columnName='name';
  static const columnChecked='check';

  //making it singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance=DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async{
    if(_database!=null) {
      return _database;
    }

    _database=await _initiateDatabase();
    return _database;

  }

  _initiateDatabase () async{
    Directory directory= await getApplicationDocumentsDirectory();
    String path = join(directory.path,_dbName);
    return await openDatabase(path,version: _dbVersion,onCreate: _onCreate);

  }

  Future? _onCreate(Database db,int version){
    db.execute(
      '''
      CREATE TABLE $_tableName (
      $columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL, 
      $columnChecked INTEGER NOT NULL,)
      '''
    );
    return null;
  }

  //{ "_id":12
  //  "name'':"Usman" }

  Future<int> insert(Map<String,dynamic> row) async{
    Database? db = await instance.database;
    return await db!.insert(_tableName, row);
  }

  Future<List<Map<String,dynamic>>> queryAll() async{
    Database? db = await instance.database;
    return await db!.query(_tableName);
  }

  
  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(_tableName);
  }
  //,where: '$columnId = ?',whereArgs: [id]

}
*/


import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  static const _dbName = 'myDatabase5.db';
  static const _dbVersion = 3;
  static const _tableName = "myTableTodo";
  static const columnId='_id';
  static const columnName='name';
  static const columnCheck ='checked';

  //making it singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance=DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async{
    if(_database!=null) {
      return _database;
    }

    _database=await _initiateDatabase();
    return _database;

  }

  _initiateDatabase () async{
    Directory directory= await getApplicationDocumentsDirectory();
    print(directory.path);
    String path = join(directory.path,_dbName);
    return await openDatabase(path,version: _dbVersion,onCreate: _onCreate);

  }
/*  void _createDb(Database db, int newVersion) async {
    await db.execute('''CREATE TABLE myTableTodo (_id INTEGER PRIMARY KEY, 
         name TEXT, checked INTEGER)''');
  }*/

  Future? _onCreate(Database db,int version){
    db.execute(
        '''
      CREATE TABLE $_tableName (
      $columnId INTEGER PRIMARY KEY , 
      $columnName TEXT NOT NULL , 
      $columnCheck INTEGER  )
      '''
    );
    return null;
  }

  //{ "_id":12
  //  "name'':"Usman" }

  Future<int> insert(Map<String,dynamic> row) async{
    Database? db = await instance.database;
    return await db!.insert(_tableName, row);
  }

  Future<List<Map<String,dynamic>>> queryAll() async{
    Database? db = await instance.database;
    return await db!.query(_tableName);
  }

  Future<int> delete() async {
    Database? db = await instance.database;
    return await db!.delete(_tableName);
  }
//,where: '$columnId = ?',whereArgs: [id]

}