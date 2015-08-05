// github user finder example
$(document).ready( function() {

  $("#github_user_lookup").on("submit", function(event) {
    console.log("hello")
    // event.preventDefault();
    var username = $("#username").val();
    var request = getGithubInfo(username);

    if(request.status == 304 || request.status == 200) {
      showUser(JSON.parse(request.responseText));
    }
    else {
     $("#profile h2").html("No such user: " + username)
    }
  });
});



function getGithubInfo(username) {
  var xhr = new XMLHttpRequest();
  xhr.open("GET", "https://api.github.com/users/" + username, false);
  xhr.send();
  return xhr;
}

function showUser(user) {
  $("#profile h2").html(user.login + " is GitHub user#" + user.id);
  $("#profile .date_created").html(user.name + " joined GiHub in " + (new Date(user.created_at)).getFullYear());
  $("#profile .information").html(
    $('<a>')
      .attr("href", user.html_url)
      .html(user.login)
      .addClass("profile")
    );
  $("#profile .avatar").html(
    $('<img>')
      .attr("src", user.avatar_url)
    );
}