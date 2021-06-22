import 'package:exam_sim2021/accueil.dart';
import 'package:exam_sim2021/authentification.dart';
import 'package:exam_sim2021/list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Esprit Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Esprit Shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<bool> fetchData() =>
      Future.delayed(Duration(microseconds: 3000), () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
    //  var b=       preferences.getBool("con");
return false;
      });


  @override
  Widget build(BuildContext context) => FutureBuilder(
  future: fetchData(),
  builder: (context, snapshot) {
    if(snapshot.hasData){
      if(snapshot.data != true){
        return Autho();
      }else{
        return Accueil();
      }
    }else if(snapshot.data == null){
      return Autho();
    }else {
      debugPrint('Step 1, build loading widget');
      print("test 5554");
      return Center(
        child: SizedBox(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
          width: 60,
          height: 60,
        ),
        // Padding(
        //   padding: EdgeInsets.all(50 ),
        //  child: Text('Awaiting result...'),
        //   )
      );
    }
  }
  );

/*
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
     child: Scaffold(
      appBar: AppBar(
        title: Text("Menu with Tabs"),

        bottom: TabBar(tabs: [
          Tab(
            text: "List Car",
            icon: Icon(Icons.list),
          ),
          Tab(
            text : "Add Car",
            icon: Icon(Icons.edit),
          )
        ]
        ),

      ),

      drawer: Drawer(
          child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text("Choose an option"),
              ),
              body: ListTile(
                title: Text("Go to Bottom nav GUI"),
                onTap: () {
                 // Navigator.pushReplacementNamed(context, "/bottom");
                },
              )
          )
      ),

      body:
      TabBarView(children: [
      //  List(),
      //  MyApp()
        FlatButton(onPressed: () async{
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString('Name',"oussama");
        }, child: Text("sherpref")),
        Listx()
      ]),

    )
    );
  }

  */
}

/*

Future<void> insertDog(Dog dog) async {
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


Future<List<Dog>> dogs() async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('dogs');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Dog(
      id: maps[i]['id'],
      name: maps[i]['name'],
      age: maps[i]['age'],
    );
  });
}






Future<void> updateDog(Dog dog) async {
  // Get a reference to the database.
  final db = await database;

  // Update the given Dog.
  await db.update(
    'dogs',
    dog.toMap(),
    // Ensure that the Dog has a matching id.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [dog.id],
  );
}
fido = Dog(
  id: fido.id,
  name: fido.name,
  age: fido.age + 7,
);
await updateDog(fido);

// Print the updated results.
print(await dogs());




Future<void> deleteDog(int id) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Dog from the database.
  await db.delete(
    'dogs',
    // Use a `where` clause to delete a specific dog.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}


 */
