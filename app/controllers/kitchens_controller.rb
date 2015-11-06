class KitchensController < ApplicationController
  def new
    @kitchen = Kitchen.new
  end

  def create
    @kitchen = Kitchen.new(kitchens_params)
    if @kitchen.save
      redirect_to @kitchen
    else
      render :new
    end
  end

  def show
    @kitchen = Kitchen.find(params[:id])
  end

  private

  def kitchens_params
    params.require(:kitchen).permit(:kitchen_name)
  end
end
