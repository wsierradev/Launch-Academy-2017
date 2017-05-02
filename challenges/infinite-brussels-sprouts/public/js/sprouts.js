// YOUR CODE GOES HERE
let currentPage = 1;

$('.more-sprouts').on('click', function(event){
 event.preventDefault();

currentPage++;
let request = $.ajax({
  method: "GET",
  url: "/tweets.json?page=" + currentPage
});

request.done(function(data) {
  data.forEach(function(tweet) {
    $('.tweets').append("<li class='tweet'><div class='body'>" + tweet['text'] + "</div><div class='user'>" + tweet['username'] + "</li>");
  });
});
});
