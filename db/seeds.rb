users = [
  ["frank", "password"],
  ["judy", "password"]
]

#date format: "2018-08-09" "year-month-day"
concerts = [
  ["Russian Inspiration", "Alice Tully Hall", "2018-10-16"],
  ["Quartet Variations", "Alice Tully Hall", "2018-10-21"],
  ["The Kreutzer Connection", "Alice Tully Hall", "2018-10-28"],
  ["The Art of the Quintet", "Alice Tully Hall", "2018-11-02"],
  ["The Trout Quintet", "Alice Tully Hall", "2018-11-13"],
  ["Death and the Maiden", "Alice Tully Hall", "2018-11-18"],
  ["Windstorm", "Alice Tully Hall", "2018-11-30"],
  ["Baroque Collection", "Alice Tully Hall", "2018-12-09"],
  ["Brandenburg Concertos", "Alice Tully Hall", "2018-12-14"]
]

attendees = [
  ["Skylar", "Huffman", "Auctioneer", 28, 7, "Learning how to play piano", 1],
  ["Taylor", "Mohamed", "Politician", 42, 9, "Ticket buy since 1992", 2],
  ["Angelica", "Nicholson", "Art critic", 32, 4, "Hates new music", 1],
  ["Rylan", "Cisneros", "Lawyer", 56, 1, "Interested in joining the board", 2],
  ["Terence", "Haas", "", nil, nil, "", nil],
  ["Rico", "Weber", "", nil, nil, "", nil],
  ["Raymond", "Delarosa", "", nil, nil, "", nil],
  ["Maddie", "Mcculloch", "", nil, nil, "", nil],
  ["Lacey", "Browning", "Computer programmer", 33, 3, "Went to Flatiron School", 1],
  ["Caiden", "Baird", "Bank manager", 41, 2, "Loves Mozart", 2],
  ["Paisley", "Brennan", "Butcher", 49, 6, "Lives in Florida during the summer", 1],
  ["Klara", "Wyatt", "Musician", 58, 7, "Interested in hosting a home concert", 2]
]

concert1_pieces = [
  ["Viotti", "Duo in G major for Two Violins, W 4.9", 1789],
  ["Mozart", "Andante and Five Variations in G major for Piano, Four Hands, K. 501", 1786],
  ["Glinka", "Variations on a theme of Mozart for Piano", 1822],
  ["Liszt", "Grand duo concertant sur la romance de ‘Le Marin’ for Violin and Piano", 1835],
  ["Field", "Nocturne No. 2 in C minor for Piano", 1812],
  ["Mendelssohn", "Lied ohne Worte in E-flat major for Piano, Op. 30, No. 1", 1830],
  ["Schumann", "Quartet in E-flat major for Piano, Violin, Viola, and Cello, Op. 47", 1842]
]

concert2_pieces = [
  ["Mozart", "Quartet in E-flat major for Piano, Violin, Viola, and Cello, K. 493", 1786],
  ["William Bolcom", "Quintet No. 1 for Piano, Two Violins, Viola, and Cello", 2000],
  ["Dvořák", "Quartet in G major for Strings, Op. 106", 1895]
]

puts "Generating Users..."
users.each do |username, password|
  User.create(username: username, password: password)
end

puts "Generating Concerts..."
concerts.each do |title, venue, date|
  Concert.create(title: title, venue: venue, date: date)
end

concert1 = Concert.find(1)
puts "Adding Pieces to Concerts..."
concert1_pieces.each do |composer, title, date_composed|
  concert1.pieces.build(title: title, composer: composer, date_composed: date_composed)
end
concert1.save

concert2 = Concert.find(2)
concert2_pieces.each do |composer, title, date_composed|
  concert2.pieces.build(title: title, composer: composer, date_composed: date_composed)
end
concert2.save

puts "Generating Attendees..."
attendees.each do |first_name, last_name, profession, age, wealth_rating, notes, user_id|
  Attendee.create(first_name: first_name, last_name: last_name, profession: profession, age: age, wealth_rating: wealth_rating, notes: notes, user_id: user_id)
end

number = 101

puts "Generating Tickets for Concert 1..."
Attendee.all.each do |attendee|
  Ticket.create(concert: concert1, attendee: attendee, seat_number: number)
  number += 1
end

puts "Generating 50 additional ticket orders..."
50.times do
  concert = Concert.all.sample
  attendee = Attendee.all.sample
  Ticket.create(concert: concert, attendee: attendee, seat_number: number)
  number += 1
end

puts "Complete!"
