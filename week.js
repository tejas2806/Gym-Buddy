google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
          ['Move', 'Pull-Ups'],
          ["Monday ", 31],
          [" Tueday", 20],
          ["Wednesday", 10],
          ['Thursday', 27],
          ['Friday', 18],
          ['Saturday', 28],
          ["Sunday ", 44],
          
        ]);

        var options = {
          width: 800,
          legend: { position: 'none' },
          chart: {
            title: 'Weekly Pull-Ups Count',
            },
          axes: {
            x: {
              0: { side: 'top', label: 'Count'} // Top x-axis.
            }
          },
          bar: { groupWidth: "50%" }
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        // Convert the Classic options to Material options.
        chart.draw(data, google.charts.Bar.convertOptions(options));
      };