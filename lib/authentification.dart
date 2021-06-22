
import 'dart:convert';

import 'package:exam_sim2021/accueil.dart';
import 'package:exam_sim2021/class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'package:http/http.dart'as http;

class Autho extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return MyAutho();
  }
}

class MyAutho extends StatefulWidget {
  @override
  _MyAuthoState createState() => _MyAuthoState();
  //String _name;
  GlobalKey<FormState> _keyForm = new GlobalKey<FormState>();
  String _email;
  String _pwd;


}

class _MyAuthoState extends State<MyAutho> {

  var database;

  void initState() {
    super.initState();
  }


  Future<String> fetchData() =>
      Future.delayed(Duration(microseconds: 3000), () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
      //  widget._name = await preferences.getString('Name');
        return "true";
      });

  @override
  Widget build(BuildContext context) =>
      FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            return Scaffold(
                appBar: AppBar(title: Text("Esprit Shop"),),
                body: Center(
                  child: Form(
                      key: widget._keyForm,
                      child: Column(
                        children: [
                          SizedBox(
                            child: Text(""),
                            height: 200,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              contentPadding:
                                 EdgeInsets.all(20),

                              labelText: 'Email',


                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "must not be empty";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (String value) {
                              widget._email = value;
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.all(20),

                              labelText: 'Mot de passe',


                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "must not be empty";
                              } else if(value.length < 4){
                                return "longueur inferier a 4";
                              }else {
                                return null;
                              }
                            },
                            onSaved: (String value) {
                              widget._pwd = value;
                            },
                          ),
                          FlatButton(
                              onPressed: ()async{
                                if (!widget._keyForm.currentState.validate()) return;
                                widget._keyForm.currentState.save();
                                String email= widget._email;
                                String pwd = widget._pwd;
                                const headers = {"Content-Type": "application/json"};
                                user item =user(username: email,pwd: pwd);
                                print(item.toMap());
                                http.post("http://10.0.2.2:9090/user/signin" ,headers: headers,body: json.encode(item.toMap()))
                                    .then((data) async {
                                      print(data);
                                  if(data.statusCode == 200){
                                    final Map<String, dynamic> jsonData = json.decode(data.body);

                                    print(jsonData);
                                    if(jsonData.containsKey("_id") ){
                                      SharedPreferences preferences = await SharedPreferences.getInstance();
                                      preferences.setBool("con", true);
                                      print(jsonData["email"]);
                                     // preferences.setString("na", value)
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Accueil();
                                          },
                                        ),
                                      );
                                    }

                                    return null;
                                  }
                                  return null;
                                });

                              },
                              child: Text("SE connecter")
                          )
                        ],
                      )
                  ) ,
                )
            );
          });

}



/*

Future<void> insertDog(Classe dog) async {
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


Column(
            children: [

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

                insertDog(Classe(id: 18, name: "name", age: 555));
                dogs();
              },
                  child: Text(" tap"))
            ],

          ),
          Future<List<Classe>> dogs() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      print(maps[i]['id']);
      return Classe(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }
}
 */