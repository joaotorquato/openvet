class PetsController < ActionController::Base
  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to @pet
    else
      render :new
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  private

  def pet_params
    params.require(:pet).permit(:owner, :name, :species, :breed, :gender,
                                :birth_date, :photo, :address)
  end
end
