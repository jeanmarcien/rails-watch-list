class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def create
    genre_details = List::GENRE_DETAILS[params[:list][:name]]
    @list = List.new(list_params)
    if genre_details
      @list.description = genre_details[:description]
      @list.image_url = genre_details[:image_url]
    end

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name, :description, :image_url)
  end
end
