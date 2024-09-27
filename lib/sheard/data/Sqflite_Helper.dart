import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../Models/weatherModel.dart';

class Sqflite_Helper {
  Database? database;

  Future getDatabase() async {
    if (database == null) {
      database = await initDatabase();
      return database;
    } else {
      return database;
    }
  }

  Future initDatabase() async {
    String path = join(await getDatabasesPath(), 'weather.db');
    return openDatabase(path, version: 2, onCreate: (Database db, int v) async {
      Batch batch = db.batch();
      batch.execute('''

create table weather(
      id integer primary key autoincrement,
      city TEXT,
      min TEXT,
      Max TEXT,
      condition TEXT,
      image TEXT,
      aver integer
)
''');
      batch.commit();
    });
  }

  insert(WeatherModel weather) async {
    Database db = await getDatabase();
    Batch batch = db.batch();
    batch.insert('weather', weather.ToMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    batch.commit();
  }

  Future<List<Map>> loadData() async {
    Database db = await getDatabase();

    List<Map> maps = await db.query('weather');
    List<Map> genertedList = [];
    for (int i = 0; i < maps.length; i++) {
      Map genertedMap = {
        "id": maps[i]["id"],
        "city": maps[i]["city"],
        "min": maps[i]["min"],
        "Max": maps[i]["Max"],
        "condition": maps[i]["condition"],
        "image": maps[i]["image"],
        'aver': maps[i]["aver"]
      };
      genertedList.add(genertedMap);
    }
    return genertedList;
  }

  delete(int id) async {
    Database db = await getDatabase();
    db.delete('weather', where: 'id =?', whereArgs: [id]);
  }
}
