
import 'package:exam_sim2021/class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class Listx extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return MyList();
  }
}

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
  String _name;




}

class _MyListState extends State<MyList> {

  var database;
  void initState() {
    super.initState();
  }


  Future<String> fetchData() =>
      Future.delayed(Duration(microseconds: 3000), () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        widget._name = await preferences.getString('Name');
        return 'list';
      });

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        return Scaffold(
          body: Column(
            children: [
              Text(widget._name),
              Text('test test'),
              FlatButton(onPressed: () async {
                WidgetsFlutterBinding.ensureInitialized();

                database = openDatabase(
                  join(await getDatabasesPath(), 'Exam_database.db'),

                  onCreate: (db, version) {
                    return db.execute(
                      'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
                    );
                  },
                  version: 1,
                );

              //  insertDog(Classe(id: 18, name: "name", age: 555));
                dogs();
              },
                  child: Text(" tap"))
            ],

          ),
        );
      });


  Future<void> insertDog(user dog) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<user>> dogs() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      print(maps[i]['id']);
      return null;
    });
  }
}