class PetsController < ApplicationController
  before_action :authenticate_user!

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
  end

  def show
    @pet = Pet.find(params[:id])
  end

  private

  def pet_params
    params.require(:pet).permit(:owner, :name, :species, :breed, :gender,
                                :birth_date, :photo, :address, :user_id)
  end
end
