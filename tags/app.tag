<app>

  <h1>Children Progress Tracker</h1>
  <canvas ref="myChart" width="100%"></canvas>

  <!-- <div ref="x">
    xxx
  </div> -->

  <script>
    var that = this;

    // Canvas element isn't available until after this tag is mounted. ChartJS requires the canvas element, so we use a lifecycle event.

    var lineChartData = {
      labels: [
        "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"
      ],
      datasets: [
        {
          label: 'accuracy',
          lineTension: 0,
          pointRadius: 5,
          data: [
            12,
            19,
            3,
            5,
            2,
            3
          ],

          yAxisID: 'y-axis-1',
          backgroundColor: ['rgba(255, 99, 132, 0.2)'],

          borderColor: ['rgba(255,99,132,1)'],
          borderWidth: 1
        }, {
          label: 'accuracy',
          lineTension: 0,
          pointRadius: 5,
          data: [
            100, 20, 50, 60, 50
          ],
          yAxisID: 'y-axis-2',
          backgroundColor: ['rgba(255, 159, 64, 0.2)'],
          borderColor: ['rgba(255, 206, 86, 1)'],
          borderWidth: 1
        }
      ]
    };

    this.on('mount', function () {

      console.log('mount');

      var ctx = this.refs.myChart.getContext('2d');
      var myChart = new Chart(ctx, {
        type:'line',

        data: lineChartData,
        options: {
          responsive: true,
          hoverMode: 'index',
          stacked: false,
          title: {
            display: true,
            text: 'Chart.js Line Chart - Multi Axis'
          },
          scales: {
            yAxes: [
              {
                type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                display: true,
                position: 'left',
                id: 'y-axis-1'
              }, {
                type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                display: true,
                position: 'right',
                id: 'y-axis-2',
                // grid line settings
                gridLines: {
                  drawOnChartArea: false, // only want the grid lines for one axis to show up
                }
              }
            ]
          }
        }

      });

      this.on('updated', function () {
        console.log('updated');
      });
    });
  </script>

  <style>
    :scope {
      display: block;
    }
    [ref="x"] {
      background-color: dodgerblue;
      width: 50px;
    }
  </style>
</app>
