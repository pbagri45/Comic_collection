class ReviewsController < ApplicationController
  before_action :set_comic, only: [:new, :create]

  def new
    @review = @comic.reviews.build
  end

  def create
    @review = @comic.reviews.build(review_params)
    if @review.save
      redirect_to @comic, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def set_comic
    @comic = Comic.find(params[:comic_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
