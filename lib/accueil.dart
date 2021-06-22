
import 'package:exam_sim2021/class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class Accueil extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return MyAccueil();
  }
}

class MyAccueil extends StatefulWidget {
  @override
  _MyAccueilState createState() => _MyAccueilState();
  String _name;




}

class _MyAccueilState extends State<MyAccueil> {

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
          appBar: AppBar(title: Text("Esprit Shop"),),
          drawer: Drawer(
              child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title:Container(child: Row(
                      children: [
                        Image.network("http://10.0.2.2:9090/img/m1.png",width: 50,height: 50,),
                        Column(children: [
                          Text("Klod"),
                          Text("Email")
                        ],)],

                    ),),
                  ),
                  body: ListTile(
                    title: Container(child: Row(
                      children: [Icon(Icons.power_settings_new),
                        Text("se Deconnecter")],

                    ),),

                    onTap: () {

                      // Navigator.pushReplacementNamed(context, "/bottom");
                    },
                  )
              )
          ),

          body: Column(
            children: [
            ],

          ),
        );
      });

}