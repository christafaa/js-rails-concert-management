class Concert {
  constructor(data) {
    this.id = data.id;
    this.title = data.title;
    this.venue = data.venue;
    this.date = data.date;
  }

  displayDate() {
    let date = new Date(this.date)
    return date.toLocaleDateString("en-US", {year: 'numeric', month: 'long', day: 'numeric'});
  }
}

$(function() {
  getConcerts();
  addEventListeners();
});

function getConcerts() {
  $.getJSON("/concerts", function(data) {
    appendConcerts(data);
  });
}

function appendConcerts(data) {
  let concerts = []
  data.forEach(function(concertData) {
    concerts.push(new Concert(concertData));
  });
  $(".display").html(HandlebarsTemplates['concerts_template'](concerts));
  addConcertLinkListeners();
}

function appendConcert(data) {
  let concert = new Concert(data)
  $(".display").html(HandlebarsTemplates['concert_template'](concert));
  appendAttendees(data.attendees);
}

// function addSubmitListener() {
//   $("input#submit").on("click", function(e) {
//     e.preventDefault();
//     e.form.value
//     debugger
//   });
// }

function addConcertLinkListeners() {
  $("a.concert-link").on("click", function(e) {
    e.preventDefault();
    const id = this.id
    $.getJSON("/concerts/" + id, function(data) {
      appendConcert(data);
    });
  });

  $("a#create-concert-link").on("click", function(e) {
    e.preventDefault();
    // $(".display").append();
    // addSubmitListener();
  });
}

function addEventListeners() {
  $("div#concerts-link").on("click", function(e) {
    e.preventDefault();
    $(".display").html("");
    getConcerts();
  });
}
