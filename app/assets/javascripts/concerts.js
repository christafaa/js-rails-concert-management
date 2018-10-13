class Concert {
  constructor(data) {
    this.id = data.id;
    this.title = data.title;
    this.venue = data.venue;
    this.date = data.date;
  }

  displayDate() {
    let date = new Date(this.date)
    return date.toLocaleDateString("en-US", {year: 'numeric', month: 'long', day: 'numeric', timeZone: 'UTC'});
  }
}

$(function() {
  getConcerts();
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
  $(".lists").html(HandlebarsTemplates['concerts_template'](concerts));
  addConcertLinkListeners();
}

function showConcert(data) {
  let concert = new Concert(data)
  $(".display").html(HandlebarsTemplates['concert_show_template'](concert));
  appendAttendees(data.attendees);
}

function appendConcert(data) {
  let concert = new Concert(data);
  $(".lists table").append(HandlebarsTemplates['concert_append_template'](concert));
  addConcertLinkListeners();
}

function addSubmitListener() {
  $("form#new_concert").on("submit", function(e) {
    e.preventDefault();
    $.post(this.action, $(this).serialize(), function(data) {
      appendConcert(data);
    });
  });
}

function addConcertLinkListeners() {
  $("a.concert-link").on("click", function(e) {
    e.preventDefault();
    const id = this.id
    $.getJSON("/concerts/" + id, function(data) {
      showConcert(data);
    });
  });

  $("a#create-concert-link").on("click", function(e) {
    e.preventDefault();
    $.get("/concerts/new", function(data) {
      $("#create-concert").html(data)
      addSubmitListener();
    });
  });
}
