class TicketsController < ApplicationController
  def create
    ticket = Ticket.create(ticket_params)

    redirect_to concert_path(ticket_params[:concert_id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:attendee_id, :concert_id, :seat_number)
  end
end
