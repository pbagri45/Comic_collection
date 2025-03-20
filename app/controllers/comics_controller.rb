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

  def index
    @comics = Comic.paginate(page: params[:page], per_page: 10)
  end
  def index
    @comics = Comic.all
    @comics = @comics.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
    @comics = @comics.where(publisher_id: params[:publisher_id]) if params[:publisher_id].present?
    @comics = @comics.where(series_id: params[:series_id]) if params[:series_id].present?
    @comics = @comics.paginate(page: params[:page], per_page: 10)
  end
end
