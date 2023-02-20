import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'dart:ui';

import 'dashb.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IoT APP',
      theme: ThemeData(
          // primarySwatch: Color.fromARGB(255, 57, 76, 224),
          ),
      home: ControlPage(),
    );
  }
}

class ControlPage extends StatefulWidget {
  ControlPage();

  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  final dbRef = FirebaseDatabase.instance.reference();

  var _colled = Colors.grey;
  var _colled1 = Colors.grey;
  var _colporte = Colors.grey;
  var _colalarme = Colors.grey;
  var _colall = Colors.grey;
  bool LED_STATUS = false;
  bool LED1_STATUS = false;
  bool Porte_STATUS = false;
  bool Mouvement_STATUS = false;
  bool allstate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: Text(
          "My Home Control App ",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Table(
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "CONTROL PAGE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Image.network(
                    'https://www.slashgear.com/wp-content/uploads/2019/01/IoT-1280x720.jpg'),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, right: 5.0, left: 5.0, bottom: 5.0),
                child: Card(
                  child: Column(children: <Widget>[
                    Icon(
                      Icons.lightbulb_outline,
                      size: 60.0,
                      color: _colled,
                    ),
                    Text(
                      " LED_STATUS",
                    ),
                    Switch(
                      value: LED_STATUS,
                      onChanged: (bool s) {
                        setState(() {
                          LED_STATUS = s;
                          print("LED_STATUS: $LED_STATUS");

                          if (s) {
                            _colled = Colors.amber;
                            dbRef.child("My_Home_Data").update({
                              'LED_STATUS': true,
                            });
                            Fluttertoast.showToast(
                              msg: 'LED est Allumee',
                            );
                          } else {
                            _colled = Colors.grey;
                            dbRef.child("My_Home_Data").update({
                              'LED_STATUS': false,
                            });
                            Fluttertoast.showToast(
                              msg: 'LED est Eteinte',
                            );
                          }
                        });
                      },
                    ),
                  ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, right: 5.0, bottom: 5.0),
                child: Card(
                  child: Column(children: <Widget>[
                    Icon(
                      Icons.lightbulb_outline,
                      size: 60.0,
                      color: _colled1,
                    ),
                    Text("LED1_STATUS"),
                    Switch(
                      value: LED1_STATUS,
                      onChanged: (bool s) {
                        setState(() {
                          LED1_STATUS = s;
                          print("LED1_STATUS :$LED1_STATUS");

                          if (s) {
                            _colled1 = Colors.amber;
                            dbRef.child("My_Home_Data").update({
                              'LED1_STATUS': true,
                            });
                            Fluttertoast.showToast(
                              msg: 'LED1 est Allumee',
                            );
                          } else {
                            _colled1 = Colors.grey;
                            dbRef.child("My_Home_Data").update({
                              'LED1_STATUS': false,
                            });
                            Fluttertoast.showToast(
                              msg: 'LED1 est Eteinte',
                            );
                          }
                        });
                      },
                    ),
                  ]),
                ),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, right: 5.0, left: 5.0, bottom: 5.0),
                child: Card(
                  child: Column(children: <Widget>[
                    Icon(
                      Icons.door_sliding_outlined,
                      size: 60.0,
                      color: _colporte,
                    ),
                    Text("Porte_STATUS"),
                    Switch(
                      value: Porte_STATUS,
                      onChanged: (bool s) {
                        setState(() {
                          Porte_STATUS = s;
                          print("Porte_STATUS :$Porte_STATUS");

                          if (s) {
                            _colporte = Colors.amber;
                            dbRef.child("My_Home_Data").update({
                              'Porte_STATUS': true,
                            });
                            Fluttertoast.showToast(
                              msg: 'La Porte est Ouvert',
                            );
                          } else {
                            _colporte = Colors.grey;
                            dbRef.child("My_Home_Data").update({
                              'Porte_STATUS': false,
                            });
                            Fluttertoast.showToast(
                              msg: 'La Porte est Ferme',
                            );
                          }
                        });
                      },
                    ),
                  ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, right: 5.0, bottom: 5.0),
                child: Card(
                  child: Column(children: <Widget>[
                    Icon(
                      Icons.alarm_on_outlined,
                      size: 60.0,
                      color: _colalarme,
                    ),
                    Text("Mouvement_STATUS"),
                    Switch(
                      value: Mouvement_STATUS,
                      onChanged: (bool s) {
                        setState(() {
                          Mouvement_STATUS = s;
                          print("Mouvement_STATUS: $Mouvement_STATUS");

                          if (s) {
                            _colalarme = Colors.amber;
                            dbRef.child("My_Home_Data").update({
                              'Mouvement_STATUS': true,
                            });
                            Fluttertoast.showToast(
                              msg: 'Alarme  Activer',
                            );
                          } else {
                            _colalarme = Colors.grey;
                            dbRef.child("My_Home_Data").update({
                              'Mouvement_STATUS': false,
                            });
                            Fluttertoast.showToast(
                              msg: 'Alarme Desactiver',
                            );
                          }
                        });
                      },
                    ),
                  ]),
                ),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, right: 5.0, left: 5.0, bottom: 5.0),
                child: Card(
                  child: Column(children: <Widget>[
                    Icon(
                      Icons.settings,
                      size: 60.0,
                      color: Colors.indigoAccent,
                    ),
                    Text("Parametres"),
                    ElevatedButton(
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _showDialog("Parametres",
                            "En Cours de construction...!", "OK!", "OK OK..!");
                      },
                    ),
                  ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, right: 5.0, bottom: 5.0),
                child: Card(
                  child: Column(children: <Widget>[
                    Icon(
                      Icons.all_inclusive,
                      size: 60.0,
                      color: _colall,
                    ),
                    Text("Control Tout"),
                    Switch(
                      value: allstate,
                      onChanged: (bool s) {
                        setState(() {
                          allstate = s;
                          print("all: $allstate");

                          if (s) {
                            _colall = Colors.amber;

                            _colled = Colors.amber;
                            _colled1 = Colors.amber;

                            LED_STATUS = true;

                            LED1_STATUS = true;
                            dbRef.child("My_Home_Data").update({
                              'LED_STATUS': true,
                              'LED1_STATUS': true,
                            });
                          } else {
                            _colall = Colors.grey;
                            _colled = Colors.grey;
                            _colled1 = Colors.grey;

                            LED_STATUS = false;

                            LED1_STATUS = false;
                            dbRef.child("My_Home_Data").update({
                              'LED_STATUS': false,
                              'LED1_STATUS': false,
                            });
                          }
                        });
                      },
                    ),
                  ]),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  void _showDialog(String title, String body, String action1, String action2) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("$title"),
          content: new Text("$body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new ElevatedButton(
              child: new Text("$action1"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: new Text("$action2"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
