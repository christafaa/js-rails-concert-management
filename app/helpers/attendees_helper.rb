module AttendeesHelper
  def display_seats(concert, attendee)
    tickets = Ticket.all.select {|ticket| ticket.concert == concert && ticket.attendee == attendee}
    seat_numbers = tickets.map {|ticket| ticket.seat_number}.join(", ")
  end

  def attendees_and_sort_status(collection, sort_method)
    if sort_method
      case sort_method
      when "Alphabetical"
        attendees = collection.alpha.uniq
        sort_status = "Alphabetical"
      when "Best Wealth Rating"
        attendees = collection.best_wealth_rating.uniq
        sort_status = "Best Wealth Rating"
      when "Most Season Tickets"
        attendees = collection.most_tickets.uniq
        sort_status = "Most Season Tickets"
      when "Top Prospects"
        attendees = Attendee.top_prospects(collection).uniq
        sort_status = "Top Prospects"
      end
    else
      attendees = collection.alpha.uniq
      sort_status = "Alphabetical"
    end
    [attendees, sort_status]
  end
end
