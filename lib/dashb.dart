import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import 'main.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;

  late AnimationController progressController;
  late Animation<double> tempAnimation;
  late Animation<double> humidityAnimation;

  @override
  void initState() {
    super.initState();

    //============================= Read onData Change ===============================
    DatabaseReference data1 =
        FirebaseDatabase.instance.ref('My_Home_Data/Sensors_Data/Temperature');
    data1.onValue.listen((DatabaseEvent event) {
      final temperature = event.snapshot.value;
      print("Temperature Data : $temperature");
    });

    DatabaseReference data2 =
        FirebaseDatabase.instance.ref('My_Home_Data/Sensors_Data/Humidity');
    data2.onValue.listen((DatabaseEvent event) {
      final humidity = event.snapshot.value;
      print("\nHumidity Data : $humidity");
    });
    //============================= Read onData Change ===============================
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard '),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Text('Bienvenue '),
    );
  }
}
