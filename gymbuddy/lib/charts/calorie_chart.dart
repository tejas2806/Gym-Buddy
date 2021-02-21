import 'package:flutter/material.dart';
import 'package:gymbuddy/charts/chart_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CalorieChart extends StatelessWidget {

  final List<Calories> data;
  CalorieChart({this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Calories, String>> series = [
      charts.Series(
        id: 'Calories',
        data: data,
        domainFn: (Calories series, _) => series.week,
        measureFn: (Calories series, _) => series.calories,
        colorFn: (Calories series, _) => series.barColor,
      )
    ];
    return Container(
      height: 300,
      padding: EdgeInsets.all(20.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Calories'),
              Expanded(child: charts.BarChart(series))
            ],
          ),
        ),
      ),
    );
  }
}
