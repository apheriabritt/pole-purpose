import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../data/savedModels.dart';

class SavedDatabaseService {
  String path;

  SavedDatabaseService._();

  static final SavedDatabaseService db = SavedDatabaseService._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await init();
    return _database;
  }

  init() async {
    String path = await getDatabasesPath();
    path = join(path, 'mix.db');
    print("Entered path $path");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE MixSet (_id INTEGER PRIMARY KEY, card1 INTEGER, card2 INTEGER, card3 INTEGER);');
          print('New table created at $path');
        });
  }

  Future<List<SavedModel>> getNotesFromDB() async {
    final db = await database;
    List<SavedModel> notesList = [];
    List<Map> maps = await db.query('MixSet',
        columns: ['_id', 'card1', 'card2', 'card3']);
    if (maps.length > 0) {
      maps.forEach((map) {
        notesList.add(SavedModel.fromMap(map));
      });
    }
    return notesList;
  }

  Future<int> getNextAvailableId() async {
    final db = await database;
    List<Map> maps = await db.query('MixSet',
        columns: ['_id', 'card1', 'card2', 'card3']);
   
    return maps.length + 1;
  }


  updateSavedSetInDB(SavedModel updatedSet) async {
    final db = await database;
    await db.update('MixSet', updatedSet.toMap(),
        where: '_id = ?', whereArgs: [updatedSet.id]);
    print('Set updated: ${updatedSet.id} ${updatedSet.card1} ${updatedSet.card2} ${updatedSet.card3}');
  }

  deleteNoteInDB(int id) async {
    final db = await database;
    await db.delete('MixSet', where: '_id = ?', whereArgs: [id]);
    print('Set deleted');
  }

  Future<SavedModel> addSavedSetInDB(SavedModel newSet) async {
    final db = await database;
    int id = await db.transaction((transaction) {
      transaction.rawInsert(
          'INSERT into MixSet(card1, card2, card3) VALUES ("${newSet.card1}", "${newSet.card2}", "${newSet.card3}");');
    });
    newSet.id = id;
    print('Set added: ${newSet.card1} ${newSet.card2} ${newSet.card3}');
    return newSet;
  }
}