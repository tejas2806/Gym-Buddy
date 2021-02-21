import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymbuddy/models/person.dart';
import 'package:provider/provider.dart';
import 'package:gymbuddy/screens/home/persontile.dart';

class PersonList extends StatefulWidget {
  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  @override
  Widget build(BuildContext context) {

    final person = Provider.of<List<Person>>(context) ?? [];
    person.forEach((person) {
      print(person.set);
      print(person.reps);
      print(person.calories);
    });

    return ListView.builder(
      itemCount: person.length,
      itemBuilder: (context, index) {
        return PersonTile(person: person[index]);
      },
    );
  }
}
