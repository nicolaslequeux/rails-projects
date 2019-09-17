class PetsController < ApplicationController

  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = current_user.pets
  end

  def new
    @pet = current_user.pets.new
  end

  def create
    @pet = current_user.pets.new(pet_params)
    if @pet.save
      redirect_to pets_path, success: 'Votre animal a bien été créé'
    else
      render :new
    end
  end

  def edit
    #rien de plus à faire que ce qui est déjà dans le before_action
  end

  def update
    if @pet.update(pet_params)
      redirect_to pets_path, success: 'Votre animal a bien été modifié!'
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path, success: "Votre animal a bien été supprimé"
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :gender, :birthday, :species_id, :avatar_file)
  end

  def set_pet
    @pet = current_user.pets.find(params[:id])
  end


end
