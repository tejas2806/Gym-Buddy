import 'package:charts_flutter/flutter.dart' as charts;

class Calories {
  final String week;
  final int calories;
  final charts.Color barColor;

  Calories ({this.week, this.calories, this.barColor});
}