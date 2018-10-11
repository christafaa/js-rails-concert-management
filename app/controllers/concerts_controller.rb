class ConcertsController < ApplicationController
  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)

    if @concert.save
      redirect_to concert_path(@concert)
    else
      render :new
    end
  end

  def index
    @concerts = Concert.all
    render json: @concerts
  end

  def edit
    @concert = Concert.find(params[:id])
  end

  def show
    @concert = Concert.find(params[:id])
    # @path = concert_path(@concert)
    # collection = Attendee.collection_of(@concert)
    # @attendees, @sort_status = helpers.attendees_and_sort_status(collection, params[:sort])
    render json: @concert
  end

  def update
    @concert = Concert.find(params[:id])
    @concert.update(concert_params)

    if @concert.save
      redirect_to concert_path(@concert)
    else
      render :edit
    end
  end

  private

  def concert_params
    params.require(:concert).permit(:title, :venue, :date)
  end
end
