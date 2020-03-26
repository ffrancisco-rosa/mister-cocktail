class CocktailsController < ApplicationController
  before_action :find, only: [:show, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = Dose.where(cocktail_id: @cocktail)
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save!
      redirect_to cocktail_path(@cocktail)
    else
      render new_cocktail_path, notice: "Something went wrong! Please try again!"
    end
  end

  def destroy
    @cocktail.destroy!
  end

  private

  def find
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
