class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    # we need `cocktail_id` to asssociate dose with corresponding cocktail
    @dose.cocktail = @cocktail
    # @dose.save
    # redirect_to cocktail_path(@cocktail)

    if @dose.save
      # raise
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    # raise
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy!
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
