import 'package:flutter/material.dart';
import 'package:gymbuddy/charts/calorie_chart.dart';
import 'package:gymbuddy/charts/chart_data.dart';
import 'package:gymbuddy/models/person.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PersonTile extends StatelessWidget {

  final Person person;
  PersonTile({this.person});

  @override
  Widget build(BuildContext context) {

    final List<Calories> data1 = [
      Calories(
          week: 'Week-1',
          calories: 180,
          barColor:charts.ColorUtil.fromDartColor(Colors.blue)
      ),
      Calories(
          week: 'Week-2',
          calories: 230,
          barColor:charts.ColorUtil.fromDartColor(Colors.blue)
      ),
      Calories(
          week: 'This week',
          calories: person.calories,
          barColor:charts.ColorUtil.fromDartColor(Colors.blue)
      ),
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
                backgroundImage: AssetImage('assets/among.png'),
                radius: 30.0
            ),
          ),
          Divider(
              height: 40.0,
              color: Colors.blue[900]
          ),
          Text(
            'Name:',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            person.name,
            style: TextStyle(
                color: Colors.blue,
                letterSpacing: 2.0,
                fontSize: 23.0,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Set:',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            person.set.toString(),
            style: TextStyle(
                color: Colors.blue,
                letterSpacing: 2.0,
                fontSize: 23.0,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Reps:',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            person.reps.toString(),
            style: TextStyle(
                color: Colors.blue,
                letterSpacing: 0.5,
                fontSize: 23.0,
                fontWeight: FontWeight.bold
            ),
          ),
          CalorieChart(
            data: data1,
          )
        ],
      ),
    );
  }
}
