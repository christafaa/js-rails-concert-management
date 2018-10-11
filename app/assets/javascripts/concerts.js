class Concert {
  constructor(data) {
    this.id = data.id;
    this.title = data.title;
    this.venue = data.venue;
    this.date = data.date;
  }

  displayDate() {
    var date = new Date(this.date)
    return date.toLocaleDateString("en-US", {year: 'numeric', month: 'long', day: 'numeric'});
  }
}

$(function() {
  addEventListeners();
});

function appendConcerts(data) {
  var concerts = []
  data.forEach(function(concertData) {
    concerts.push(new Concert(concertData));
  });
  $(".display").html(HandlebarsTemplates['concerts_template'](concerts));
  addConcertLinkListeners();
}

function appendConcert(data) {
  let concert = new Concert(data)
  $(".display").html(HandlebarsTemplates['concert_template'](concert));
}

function addConcertLinkListeners() {
  $("a.concert-link").on("click", function(e) {
    e.preventDefault();
    $(".display").html("");
    const id = this.id
    $.get("/concerts/" + id, function(data) {
      appendConcert(data);
    })
  })
}

function addEventListeners() {
  $("div#concerts-link").on("click", function(e) {
    e.preventDefault();
    $(".display").html("");
    $.get("/concerts", function(data) {
      appendConcerts(data);
    });
  });

  $("span#attendees-link").on("click", function(e) {
    e.preventDefault();
    alert("hi")
  })
}
