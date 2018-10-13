class ConcertsController < ApplicationController
  def new
    @concert = Concert.new
    render "concerts/new", layout: false
  end

  def create
    @concert = Concert.create(concert_params)
    render json: @concert
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
    render json: @concert, serializer: AttendeeConcertSerializer
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
