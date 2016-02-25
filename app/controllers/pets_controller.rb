class PetsController < ApplicationController
  before_action :set_pet, only: [:show]
  before_action :authenticate_user!
  before_action :set_collections, only: [:show, :index]

  def new
    @pet = Pet.new
  end

  def create
    @user = current_user
    @pet = Pet.new(pet_params)
    @pet.set_user(current_user)
    if @pet.save
      redirect_to @pet
    else
      render :new
    end
  end

  def index
    @user = User.find(current_user.id)
    @pets = @user.pets
    @vaccinations = Vaccination.all
  end

  def show
    @vaccination = Vaccination.new(vaccine: Vaccine.new)
  end

  private

  def set_collections
    @pets = Pet.all
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:owner, :name, :species, :breed, :gender,
                                :birth_date, :photo, :address, :user_id)
  end
end
