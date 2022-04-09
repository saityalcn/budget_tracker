import 'dart:async';
import 'dart:io';
import 'package:budget_tracker/models/expense.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static final DbHelper db = DbHelper._();

  static Database? _database;

  Future<Database> get database async{
    if(_database != null){
      return _database!;
    }
    _database = await initDb();
    return _database!;
  }

  initDb() async{
    String executeText =
        "CREATE TABLE expenses(id INTEGER PRIMARY KEY,titleOfExpense TEXT, nameOfUser TEXT, cost REAL)";

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path,"expenses.db");
    return await openDatabase(path,version: 1,onCreate: (Database db, int version)async{
      await db.execute(executeText);
    });
  }

  insert(Expense newExpense)async{
    final db = await database;
    var result = await db.insert("expenses", newExpense.toMap());
    return result;
  }

  getAllGoals() async{
    final db = await database;
    var result = await db.query("expenses");
    List<Expense> list = result.isNotEmpty ? result.map((e) => Expense.fromMap(e)).toList() : [];
    return list;
  }

  updateGoal(Expense expense) async {
    final db = await database;
    var res = await db.update("expenses", expense.toMap(),
        where: "titleOfExpense = ?", whereArgs: [expense.tit]);
    return res;
  }

  deleteGoal(int id) async{
    final db = await database;
    var result = await db.delete("expenses",where: "id = ?", whereArgs: [id]);
  }


  /*
    get Expenses of a user
   */

}