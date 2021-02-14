am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_material);
am4core.useTheme(am4themes_animated);
// Themes end



// Create chart instance
var chart = am4core.create("chartdiv", am4charts.RadarChart);

// Add data
chart.data = [{
  "category": "Set",
  "value": 35,
  "full": 100
}, {
  "category": "Calories Burned",
  "value": 35,
  "full": 100
}, {
  "category": "Crunches",
  "value": 92,
  "full": 100
}, {
  "category": "Pull-Ups",
  "value": 68,
  "full": 100
}];

// Make chart not full circle
chart.startAngle = -90;
chart.endAngle = 180;
chart.innerRadius = am4core.percent(20);

// Set number format
chart.numberFormatter.numberFormat = "#.#";

// Create axes
var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "category";
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.renderer.grid.template.strokeOpacity = 0;
categoryAxis.renderer.labels.template.horizontalCenter = "right";
categoryAxis.renderer.labels.template.fontWeight = 500;
categoryAxis.renderer.labels.template.adapter.add("fill", function(fill, target) {
  return (target.dataItem.index >= 0) ? chart.colors.getIndex(target.dataItem.index) : fill;
});
categoryAxis.renderer.minGridDistance = 10;

var valueAxis = chart.xAxes.push(new am4charts.ValueAxis());
valueAxis.renderer.grid.template.strokeOpacity = 0;
valueAxis.min = 0;
valueAxis.max = 100;
valueAxis.strictMinMax = true;

// Create series
var series1 = chart.series.push(new am4charts.RadarColumnSeries());
series1.dataFields.valueX = "full";
series1.dataFields.categoryY = "category";
series1.clustered = false;
series1.columns.template.fill = new am4core.InterfaceColorSet().getFor("alternativeBackground");
series1.columns.template.fillOpacity = 0.08;
series1.columns.template.cornerRadiusTopLeft = 20;
series1.columns.template.strokeWidth = 0;
series1.columns.template.radarColumn.cornerRadius = 20;

var series2 = chart.series.push(new am4charts.RadarColumnSeries());
series2.dataFields.valueX = "value";
series2.dataFields.categoryY = "category";
series2.clustered = false;
series2.columns.template.strokeWidth = 0;
series2.columns.template.tooltipText = "{category}: [bold]{value}[/]";
series2.columns.template.radarColumn.cornerRadius = 20;

series2.columns.template.adapter.add("fill", function(fill, target) {
  return chart.colors.getIndex(target.dataItem.index);
});

// Add cursor
chart.cursor = new am4charts.RadarCursor();

});










am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end



// create chart
var chart = am4core.create("gauge", am4charts.GaugeChart);
chart.innerRadius = -15;

var axis = chart.xAxes.push(new am4charts.ValueAxis());
axis.min = 0;
axis.max = 100;
axis.strictMinMax = true;

var colorSet = new am4core.ColorSet();

var gradient = new am4core.LinearGradient();
gradient.stops.push({color:am4core.color("blue")})
gradient.stops.push({color:am4core.color("red")})
gradient.stops.push({color:am4core.color("green")})

axis.renderer.line.stroke = gradient;
axis.renderer.line.strokeWidth = 15;
axis.renderer.line.strokeOpacity = 1;

axis.renderer.grid.template.disabled = true;

var hand = chart.hands.push(new am4charts.ClockHand());
hand.radius = am4core.percent(97);

setInterval(function() {
    hand.showValue( 40, 1000, am4core.ease.cubicOut);
}, 2000);


});













function logout(){
  firebase.auth().signOut();
    window.location = "index.html";

}






 var tblUsers = document.getElementById('tbl_users_list');
  var databaseRef = firebase.database().ref('user/');
  var rowIndex = 1;
  
  databaseRef.once('value', function(snapshot) {
    snapshot.forEach(function(childSnapshot) {
   var childKey = childSnapshot.key;
   var childData = childSnapshot.val();
   
   var row = tblUsers.insertRow(rowIndex);
   var Calories=row.insertCell(0)
   var Reps = row.insertCell(1);
   var Set = row.insertCell(2);
  
    Calories.appendChild(document.createTextNode(childData.Calories));
   Reps.appendChild(document.createTextNode(childData.Reps));
   Set.appendChild(document.createTextNode(childData.Set));
   
   
   rowIndex = rowIndex + 1;

    });

  });

