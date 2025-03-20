class ComicsController < ApplicationController
  def index
    @comics = Comic.all
    
    # Add the simple search condition inside the index action
    @comics = @comics.where('title ILIKE ?', "%#{params[:simple_search]}%") if params[:simple_search].present?
    
    # Filters for title, publisher, and series
    @comics = @comics.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
    @comics = @comics.where(publisher_id: params[:publisher_id]) if params[:publisher_id].present?
    @comics = @comics.where(series_id: params[:series_id]) if params[:series_id].present?
    
    # Pagination
    @comics = @comics.paginate(page: params[:page], per_page: 10)
  end

  def show
    @comic = Comic.find_by(id: params[:id])
    if @comic.nil?
      flash[:alert] = "Comic not found."
      redirect_to comics_path
    end
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(comic_params)
    
    if @comic.save
      redirect_to @comic, notice: "Comic was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comic = Comic.find(params[:id])
  end

  def update
    @comic = Comic.find(params[:id])
    
    if @comic.update(comic_params)
      redirect_to @comic, notice: "Comic was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy
    redirect_to comics_path, notice: "Comic was successfully deleted."
  end

  private

  def comic_params
    params.require(:comic).permit(:title, :description, :publisher_id, :series_id)
  end
end
