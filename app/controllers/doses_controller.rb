class DosesController < ApplicationController
  before_action :find, only: [:destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_params)
    @cocktail = Cocktail.find(@dose.cocktail_id)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      redirect_to cocktail_path(@cocktail), notice: "Something went wrong! Please try again"
    end
  end

  def destroy
    @dose.destroy
  end

  private

  def find
    @dose = Dose.find(params[:id])
  end

  def doses_params
    params.require(:dose).permit(:cocktail_id, :ingredient_id, :description)
  end
end
