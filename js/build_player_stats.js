$(document).ready(function() {
    $.getJSON("https://olpv4m42g7z36jgcqvn2uehnbq0wbryn.lambda-url.us-east-1.on.aws/", function(players) {
        $("#player_stats").empty();

        players.forEach(player => {
            $("#player_stats").append("<tr><td>(" + player.jersey_num + ") " + player.last_name + ", " + player.first_name + 
            "</td>" + "<td>" + "0" + "</td><td>" + player.G + "</td><td>" + player.A + "</td><td>" + player.PTS + 
            "</td><td>" + player.PPG + "</td><td>" + player.PPA + "</td><td>0</td><td>0</td><td>0</td><td>0:00</td></tr>");
        });            
        
    });
  });
