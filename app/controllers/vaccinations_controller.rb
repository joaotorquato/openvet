class VaccinationsController < ApplicationController
  def new
    @vaccination = Vaccination.new
  end

  def create
    @vaccination = Vaccination.new(vaccination_params)
    if @vaccination.save
      redirect_to @vaccination
    else
      render :new
    end
  end

  def show
    @vaccination = Vaccination.find(params[:id])
  end

  private

  def vaccination_params
    params.require(:vaccination).permit(:name, :vaccination_date,
                                        :expiration_date, :veterinary)
  end
end
