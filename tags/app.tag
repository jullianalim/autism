<app>

  <h1>Student Progress Tracker</h1>
  <p>Weekly Learn Unit Scores</p>
  <canvas ref="myChart" width="100%"></canvas>

  <input type="text" ref="comment">


  <br></br>
  <h3>Data Input</h3>

  <p>Select day and enter today's Learn Unit Score.</p>
  <select ref= "week" onChange = {setWeek} >
    <option value="">Select Week</option>
    <option value="week1">Week1</option>
    <option value="week2">Week2</option>
  </select>

  <select ref="dayOfWeek" onchange={ setDay }>
    <option value="">Select Day</option>
    <option value="m">Monday</option>
    <option value="t">Tuesday</option>
    <option value="w">Wednesday</option>
    <option value="r">Thursday</option>
    <option value="f">Friday</option>
  </select>

  <input type="number" placeholder="Input Unit Score" ref="score">
  <button onclick={ setNumber }>Enter Unit Score</button>
  <br></br>
  <custom-tooltip ref="myTooltip" tooltip-data={ tooltipData } x={"Jin"}></custom-tooltip>

  <script>
    var tag = this;
    console.log('app.tag');
    this.toolText = "This is my text.";
    this.tooltipData = {};
    this.day = 'm';

    setWeek(e) {
      tag.week = tag.refs.week.value;
    }

    setDay(e) {
      tag.day = tag.refs.dayOfWeek.value;
    }

    scoresRef.on('value', function (snap) {
      var data = snap.val();

      var justScores = [];
      console.log(data);
      justScores[0] = data['week1']['m']['score'];
      justScores[1] = data['week1']['t']['score'];
      justScores[2] = data['week1']['w']['score'];;
      justScores[3] = data['week1']['r']['score'];;
      justScores[4] = data['week1']['f']['score'];;


      console.log(justScores);
      // data.map(function (obj) {
      //   return obj.score;
      // });
      var week2Scores = [];
      console.log(data);
      week2Scores[0] = data['week2']['m']['score'];
      week2Scores[1] = data['week2']['t']['score'];
      week2Scores[2] = data['week2']['w']['score'];;
      week2Scores[3] = data['week2']['r']['score'];;
      week2Scores[4] = data['week2']['f']['score'];;


      // var week2Scores = [];
      // console.log(data['m'].score);
      // week2Scores[0] = data['m'].score;
      // week2Scores[1] = data['t'].score;
      // week2Scores[2] = data['w'].score;
      // week2Scores[3] = data['r'].score;
      // week2Scores[4] = data['f'].score;


      console.log(justScores);

      tag.chart.data.datasets[0].data = justScores;
      tag.chart.data.datasets[1].data = week2Scores;


      tag.chart.update();
    });

    setNumber(e) {

      var score = tag.refs.score.value;

      console.log(tag.chart.data.datasets);

      scoresRef.child(tag.week + '/' + tag.day + '/score').set(score);

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
              label: 'Week1',
             // data: [10, 20, 30, 40, 50],
              lineTension: 0,
              backgroundColor: [
                'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)'
              ],
              borderColor: [
                'rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)'
              ],
              borderWidth: 1
            },{
              label: 'Week2',
             // data: [10, 20, 30, 40, 50],
              lineTension: 0,
              backgroundColor: [
                'rgba(100, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)'
              ],
              borderColor: [
                'rgba(100,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)'
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

                // this.chart.data.datasets[0].data[this.day] = score; this.chart.data.labels[0] = 'MONDAY';
                //
                // this.chart.update();
              }

            }


        }

      })

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
