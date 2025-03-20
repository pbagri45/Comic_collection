class ComicsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def index
    if params[:search]
      @comics = Comic.where("title LIKE ?", "%#{params[:search]}%")
    else
      @comics = Comic.all
    end
  end
end
