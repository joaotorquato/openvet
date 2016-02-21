require 'rails_helper'

describe Pet do
  describe 'creation of a pet' do
    it 'succesfully' do
      pet = build(:pet)
      expect(pet).to be_valid
      expect(pet.name).to eq 'Padmé'
    end
  end

  describe 'creation of a pet' do
    it 'with user_id null' do
      pet = build(:pet, user_id: nil)
      expect(pet).to_not be_valid
      expect(pet.errors).to include :user_id
    end
  end
end
