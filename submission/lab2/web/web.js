function updatefilter(filter) {
    sel = $(filter).find(":selected").text();

    var filterslist = [
        'equipment',
        'scoringtype',
        'gamemode',
        
        'tennis',
        'diving',
        'golf',
        'baseball',
        'soccer',
        'rugby',
        'basketball',
        'ultimate_frisbee',
        'volleyball',
        'badminton',
        'swimming',
        'skiing',
        'surfing',
        'archery',
        'karate',
        'bowling',
        'dodgeball',
        'table_tennis',
        'hockey'
    ];
    
    index = filterslist.indexOf(sel);
    index++;
    
    $('#hasform').children('select').hide();
    $('#hasform').children('#h'+index).show();
    
    
}

function ajaxHas() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("demo").innerHTML =
      this.responseText;
    }
  };
  xhttp.open("GET", "has/?has=ball", true);
  xhttp.send();
}