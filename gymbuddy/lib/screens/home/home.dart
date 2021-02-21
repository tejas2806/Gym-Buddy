import 'package:gymbuddy/screens/home/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:gymbuddy/services/auth.dart';
import 'package:gymbuddy/services/database.dart';
import 'package:provider/provider.dart';
import 'package:gymbuddy/screens/home/personlist.dart';
import 'package:gymbuddy/models/person.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Person>>.value(
      value: DatabaseService().person,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Gym Buddy'),
          backgroundColor: Colors.blueAccent,
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.white,),
              label: Text('Logout', style: TextStyle(color: Colors.white),),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: Container(
          child: PersonList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
          },
          tooltip: 'Current Location',
          child: Icon(Icons.pin_drop_outlined),
        ),
      ),
    );
  }
}
