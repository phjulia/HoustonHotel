
anychart.onDocumentReady(function() {

const occupiedRooms =$('#occupiedRooms').val();
const inactiveRooms = $('#inactiveRooms').val();
const availableRooms = $('#availableRooms').val();
  var data = [
      {x: "Zajęte pokoje", value: occupiedRooms},
      {x: "Wolne pokoje", value: availableRooms},
      {x: "Nieaktywne pokoje", value: inactiveRooms}
  ];

  // create the chart
  var chart = anychart.pie();

  // set the chart title
  chart.title("Stosunek liczby zajętych pokoi do liczby wolnych pokoi");

  // add the data
  chart.data(data);
 var palette = anychart.palettes.distinctColors();
    palette.items(['#4700D8', '#9900F0', '#F900BF', '#FF85B3']);
chart.palette(palette);
  // display the chart in the container
  chart.container('piechart');
  chart.draw();
//chart 2
const cleanRooms =$('#cleanRooms').val();
const dirtyRooms = $('#dirtyRooms').val();

  var data = [
      {x: "Czyste pokoje", value: 200},
      {x: "Brudne pokoje", value: 30}
  ];

  // create the chart
  var chart = anychart.pie();

  // set the chart title
  chart.title("Stosunek liczby czystych pokoi do liczby brudnych pokoi");

  // add the data
  chart.data(data);
 var palette = anychart.palettes.distinctColors();
    palette.items(['#FFE400', '#FF1700', '#06FF00']);
chart.palette(palette);
  // display the chart in the container
  chart.container('piechart1');
  chart.draw();
});