<chartTag>
<h1> Children Chart </h1>

<script>
 var that = this; 
 
  let mychart = document.getElementById('mychart').getContext('2d');
  let massPopChart = new Chart(mychart, {
      type : 'line',// bar, horizontal, pie, line, doughnut, radar, polar
      data:{
      labels: ['4/20','4/21','4/22','4/23','4/24','4,25'],
    datasets: [ {
      label:'Population',
      data:[
100,150,200,600,100,120,130


      ]

    }]
  },
      options:{}

  });


</script>
</chartTag>
