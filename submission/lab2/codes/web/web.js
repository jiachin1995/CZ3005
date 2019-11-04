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
    $('#hasform').children('#h'+index).fadeIn();
    
    
}

function ajaxHas() {
  var has;
  $('#hasform').find('select:visible option:selected').each(function(index, loopelement) {
        has = $(this).text();
    });

    
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      var response;
      response = $(this.responseText).text().trim();
      
      if ('10 limit reached' == response) {
          alert('10 questions limit reached. No response will be given.');
      } else {
          //read response
          response_arr = response.split(':')
          bool = response_arr[0]
          obj = response_arr[1]
          score = response_arr[2]
          total = response_arr[3]
          
          //set cookies then reload page
          str = getCookie('hashistory');
          array = str.split(",");
          array.push(bool+':'+obj); 
          
          document.cookie = "hashistory=" + array;
          
          showHistory();
          updateScore(score,total);
      }
    }
  };
  xhttp.open("GET", "has?has="+has, true);
  xhttp.send();
}

function ajaxIs() {
  var is;
  selection = $('#is').find('option:selected');
  is = selection.text();
  selection.remove();

    
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      var response;
      response = $(this.responseText).text().trim();
      
      if (response == 'Correct') {
        $("#guessbutton").prop("onclick", null).off("click");
        document.getElementById('guess_result').innerHTML = 'Correct! Starting new round in 3 seconds...';
        
        setTimeout(function () {
            location.reload();

        }, 3000);
        
      } else if (response == 'Game Over') {
          $("#guessbutton").prop("onclick", null).off("click");
          document.getElementById('guess_result').innerHTML = 'Game Over! Refresh this page to start a new game.';
      } else {
          //read response
          array = response.split(':');
          score = array[1];
          total = array[2];
          
          updateScore(score,total);
          
          
          document.getElementById('guess_result').innerHTML = 'That was the wrong guess. ' + is + ' has been removed as an option.';
      }
    }
  };
  xhttp.open("GET", "is?is="+is, true);
  xhttp.send();
}


function showHistory() {
    //get array from cookie
    str = getCookie('hashistory');
    array = str.split(",");
    
    //create table
    var content = "<table id='historytable' ><th><h4>History</h4></th>"
    for(i=1; i<array.length; i++){
        ele  = array[i];
        item = ele.split(':')
        
        if (item[0] == 'Yes') {
            content += '<tr class ="green theight" ><td> Yes. It does contain '+ item[1] +'.</td></tr>';
        } else {
            content += '<tr class ="red theight" ><td> No. It does not contain '+ item[1] +'.</td></tr>';
        }
    }
    for (i=0; i< 11-array.length; i++) {
        content += '<tr class="theight"><td></td></tr>';
    }
    
    content += "</table>"

    $('#history').empty();
    $('#history').append(content);
    
    
}

function resetCookie() {
    document.cookie = "hashistory=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
}

function updateScore(score, totalscore) {
    document.getElementById('score').innerHTML = 'Your current score is ' + score;
    document.getElementById('totalscore').innerHTML = 'Your total score is ' + totalscore;
    
}

function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i <ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}