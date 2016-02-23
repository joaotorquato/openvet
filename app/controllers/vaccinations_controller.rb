class VaccinationsController < ApplicationController
  def new
    @vaccination = Vaccination.new
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @vaccination = @pet.vaccinations.build(vaccination_params)
    if @vaccination.save
      redirect_to @pet
    else
      render template: 'pets/show'
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
