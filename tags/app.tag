<app>

  <h1>Student Progress Tracker</h1>
  <p>Weekly Learn Unit Scores</p>
  <canvas ref="myChart" width="100%"></canvas>
<<<<<<< HEAD
  <input type="text" ref="comment">
  <input type="number" ref="score">
=======


  <br></br>
  <h3>Data Input</h3>
  <p>Select day and enter today's Learn Unit Score.</p>
>>>>>>> db172333d41d7408f4ad06f5c54d06f43a1e36a7
  <select ref="dayOfWeek" onchange={ setDay }>
    <option value="m">Monday</option>
    <option value="t">Tuesday</option>
    <option value="w">Wednesday</option>
    <option value="r">Thursday</option>
    <option value="f">Friday</option>
  </select>
<<<<<<< HEAD
  <button onclick={ setNumber }>Enter Number</button>

  <custom-tooltip ref="myTooltip" tooltip-data={ tooltipData } x={"Jin"}></custom-tooltip>
=======
  <input type="number" ref="score">
	<button onclick={ setNumber }>Enter Unit Score</button>
  <br></br>
	<custom-tooltip ref="myTooltip" tooltip-data={ tooltipData } x={"Jin"}></custom-tooltip>
>>>>>>> db172333d41d7408f4ad06f5c54d06f43a1e36a7

  <script>
    var tag = this;
    console.log('app.tag');
    this.toolText = "This is my text.";
    this.tooltipData = {};
    this.day = 'm';

    setDay(e) {
      this.day = this.refs.dayOfWeek.value;
    }

    scoresRef.on('value', function (snap) {
      console.log(snap.val());
      var data = Object.values(snap.val());

      var justScores = data.map(function (obj) {
        return obj.score;
      });
      console.log(data);
      console.log(justScores);

      tag.chart.data.datasets[0].data[0] = justScores[0];
      tag.chart.data.datasets[0].data[1] = justScores[1];
      tag.chart.data.datasets[0].data[2] = justScores[2];
      tag.chart.data.datasets[0].data[3] = justScores[3];
      tag.chart.data.datasets[0].data[4] = justScores[4];

      tag.chart.update();
    });


    setNumber(e) {
<<<<<<< HEAD
      var score = this.refs.score.value;

      console.log(this.chart.data.datasets);

      scoresRef.child(this.day + '/score').set(score);
=======
  var score = this.refs.score.value;

  console.log(this.chart.data.datasets);

  scoresRef.child(this.day + '/score').set(score);

  // this.chart.data.datasets[0].data[this.day] = score;
  // this.chart.data.labels[0] = 'MONDAY';
  //
  // this.chart.update();
}


this.on('mount', function(){
  var ctx = this.refs.myChart.getContext('2d');
  this.chart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ["M", "T", "W", "R", "F"],
        datasets: [{
            label: 'Current Week',
            data: this.justScores,
            lineTension: 0,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
      tooltips: {
        enabled: false,
        position: 'average',
        custom: function(tooltipModel){
          var tooltipEl = tag.refs.myTooltip.root;

          // Question is when is this "custom" function executing?
          // console.log tells me this executes on every frame
          // console.log('tooltip', tooltipEl);

          // I want to update my tooltip (tag) on some condition...
          // Probably when the thing my cursor is over changes
          // So I have to look into where that data is to be found. more console.log
          // Turns out it has to do with callbacks, label... see below


          // Second question is, what is 'this' in this function context?
          // console.log(this);

          // `this` will be the overall tooltip
          var position = this._chart.canvas.getBoundingClientRect();

          tooltipEl.style.opacity = 1;
          tooltipEl.style.position = 'absolute';
          tooltipEl.style.left = position.left + tooltipModel.caretX + 'px';
          tooltipEl.style.top = position.top + tooltipModel.caretY + 'px';
>>>>>>> db172333d41d7408f4ad06f5c54d06f43a1e36a7


      // this.chart.data.datasets[0].data[this.day] = score; this.chart.data.labels[0] = 'MONDAY';
      //
      // this.chart.update();
    }

    this.on('mount', function () {
      var ctx = this.refs.myChart.getContext('2d');
      this.chart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: [
            "M", "T", "W", "R", "F"
          ],
          datasets: [
            {
              label: 'Learn Unit Score',
              data: this.justScores,
              lineTension: 0,
              backgroundColor: [
                'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)'
              ],
              borderColor: [
                'rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)'
              ],
              borderWidth: 1
            }
          ]
        },
        options: {
          tooltips: {
            enabled: false,
            position: 'average',
            custom: function (tooltipModel) {
              var tooltipEl = tag.refs.myTooltip.root;

              // Question is when is this "custom" function executing? console.log tells me this executes on every frame console.log('tooltip', tooltipEl); I want to update my tooltip (tag) on some condition... Probably when the thing my cursor is over changes So
              // I have to look into where that data is to be found. more console.log Turns out it has to do with callbacks, label... see below Second question is, what is 'this' in this function context? console.log(this); `this` will be the overall tooltip
              var position = this._chart.canvas.getBoundingClientRect();

              tooltipEl.style.opacity = 1;
              tooltipEl.style.position = 'absolute';
              tooltipEl.style.left = position.left + tooltipModel.caretX + 'px';
              tooltipEl.style.top = position.top + tooltipModel.caretY + 'px';

            },
            callbacks: {
              // This seems to be the callback that is called when the mouse is hovering over a tooltip trigger area Note this is triggered on any mouse movement in the trigger area So it's fine for little dynamic things (like click stuff in the tooltip)... but if
              // your tooltip riot tag is going to do something like a firebase query -... it's going to fire off a query many many times. So you need some control to only query if for example, the value has changed. etc.
              label: function (tooltipItem, data) {
                console.log('TOOLTIPITEM:', tooltipItem);
                console.log('DATA:', data)
                tag.tooltipData = tooltipItem;
                tag.update();
              }
            }
          }
        }
      });

    });

    // Canvas element isn't available until after this tag is mounted. ChartJS requires the canvas element, so we use a lifecycle event.
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
