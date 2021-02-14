$(document).ready(function () {

    var rewards = localStorage.getItem("Rewards");
    $("#rewardlabel").html("Calories Burned: "+ rewards);

    if(rewards > 2500) {
        $("#mathlabel").html("Congrats! You may claim a prize!");
    }
    else {
        $("#mathlabel").html((1000-rewards) +" more Calories To Be Burned!");
    }
     var bar = new ProgressBar.Line(progressbar, {
      strokeWidth: 1,
      easing: 'easeInOut',
      duration: 1400,
      color: '#9adac3',
      trailColor: '#eee',
      trailWidth: 1,
      svgStyle: {width: '100%', height: '100%'},
      text: {
        style: {
          // Text color.
          // Default: same as stroke color (options.color)
          color: '#000000',
          position: 'absolute',
          right: '0',
          top: '40px',
          padding: '30px',
          margin: 0,
          transform: null
        },
        autoStyleContainer: false
      },
      from: {color: '#FFEA82'},
      to: {color: '#ED6A5A'},
      step: (state, bar) => {
        if(rewards <= 2500) {   
            bar.setText(Math.round(bar.value() * 2500) + '/1000');
        }
        else {
            bar.setText(rewards + '/1000');
        }
      }
    });

    if(rewards > 2500)
    {   
        // bar.setValue(rewards);
        bar.animate(1.0); 
    }
    else 
    {
        bar.animate(rewards/2500); 
    }

     $(".giftbtn").click(function () {
     	if(rewards < 2500)
     	{
     		alert("You don't have enough points")
     	}
    });









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

});




function logout(){
  firebase.auth().signOut();
    window.location = "index.html";

}







