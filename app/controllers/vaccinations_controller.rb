class VaccinationsController < ApplicationController
  def new
    @vaccination = Vaccination.new
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @vaccination = Vaccination.build_vaccination(@pet, vaccination_params)
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

  def find_vaccine
    Vaccine.find_by(name: params[:vaccination][:name])
  end

  def vaccination_params
    params.require(:vaccination).permit(:vaccination_date,
                                        :expiration_date,
                                        :veterinary,
                                        vaccine_attributes: [:name])
  end
end
