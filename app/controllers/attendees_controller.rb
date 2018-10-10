class AttendeesController < ApplicationController
  def create
    attendee = Attendee.find_or_create_by(first_name: attendee_params[:first_name], last_name: attendee_params[:last_name])
    concert = Concert.find(params[:concert_id])
    seat_number = params[:ticket][:seat_number]

    if attendee && concert && seat_number
      Ticket.create(concert: concert, attendee: attendee, seat_number: seat_number)
    end

    redirect_to concert_path(concert)
  end

  def edit
    @attendee = Attendee.find(params[:id])
    @users = User.all
  end

  def update
    @attendee = Attendee.find_by(id: params[:id])
    @users = User.all
    if @attendee.update(attendee_params)
      redirect_to attendee_path(@attendee)
    else
      render :edit
    end
  end

  def show
    @attendee = Attendee.find(params[:id])
  end

  def index
    @path = attendees_path
    @attendees, @sort_status = helpers.attendees_and_sort_status(Attendee.all, params[:sort])
  end

  def most_tickets
    @path = attendees_path
    @attendees = Attendee.all.most_tickets.uniq
    @sort_status = "Most Tickets"
    render :index
  end

  def best_wealth_rating
    @path = attendees_path
    @attendees = Attendee.all.best_wealth_rating.uniq
    @sort_status = "Best Wealth Rating"
    render :index
  end

  private

  def attendee_params
    params.require(:attendee).permit(:first_name, :last_name, :profession, :age, :wealth_rating, :notes, :user_id)
  end
end
