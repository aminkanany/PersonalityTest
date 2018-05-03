draw = function (extroversion, agreeableness, conscientiousness, neuroticism, opennessToExperience) {
    var e = parseInt(extroversion);
    var a = parseInt(agreeableness);
    var c = parseInt(conscientiousness);
    var n = parseInt(neuroticism);
    var o = parseInt(opennessToExperience);

    google.charts.load('current', { 'packages': ['gauge'] });
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Label', 'Value'],
          ['E', e],
          ['A', a],
          ['C', c],
          ['N', n],
          ['O', o]

        ]);

        var options = {
            max: 40,
            redFrom: 30, redTo: 40,
            yellowFrom: 20, yellowTo: 30,
            minorTicks: 5
        };

        var chart = new google.visualization.Gauge(document.getElementById('chart_div'));

        chart.draw(data, options);
    }
}