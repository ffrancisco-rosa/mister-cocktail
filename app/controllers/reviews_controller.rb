class ReviewsController < ApplicationController
  before_action :find
  def new
    Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail_id = @cocktail.id
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      redirect_to cocktail_path(@cocktail) , notice: "#{@review.errors.full_messages.join(" and ")}!!"
    end
  end

  def edit
  end

  def update
  end

  private

  def find
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :cocktail_id)
  end
end
