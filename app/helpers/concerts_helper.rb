module ConcertsHelper
  def display_date(concert)
    DateTime.parse(concert.date).to_date.strftime("%A, %B %e, %Y")
  end
end
