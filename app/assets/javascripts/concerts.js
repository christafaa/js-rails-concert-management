class Concert {
  constructor(data) {
    this.id = data.id;
    this.title = data.title;
    this.venue = data.venue;
    this.date = data.date;
  }
}



$(function() {
  addEventListeners();
});

function addEventListeners() {
  $("div#concerts-link").on("click", function(e) {
    e.preventDefault();
    $(".display").html("");
    $.get("/concerts", function(data) {
      data.forEach(function(concertData) {
        let newConcert = new Concert(concertData)
        $(".display").append(newConcert.title + "<br>")
      });
    });
  });

  $("span#attendees-link").on("click", function(e) {
    e.preventDefault();
    alert("hi")
  })
}
