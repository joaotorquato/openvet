require 'rails_helper'

feature 'User register a new pet' do
  scenario 'succesfully' do
    pet = build(:pet)
    create(:user)

    login

    visit new_pet_path

    fill_in 'pet[owner]', with: pet.owner
    fill_in 'pet[name]', with: pet.name
    select pet.species, from: 'pet[species]'
    fill_in 'pet[breed]', with: pet.breed
    select pet.gender, from: 'pet[gender]'
    select '2016', from: 'pet[birth_date(1i)]'
    select 'August', from: 'pet[birth_date(2i)]'
    select '1', from: 'pet[birth_date(3i)]'
    fill_in 'pet[address]', with: pet.address
    attach_file 'pet[photo]', 'spec/images/pets/padme.jpg'

    click_on 'Registrar pet'

    expect(page).to have_content pet.owner
    expect(page).to have_content pet.name
    expect(page).to have_content pet.species
    expect(page).to have_content pet.breed
    expect(page).to have_content pet.gender
    expect(page).to have_content pet.birth_date.strftime('%d/%m/%Y')
    expect(page).to have_content pet.address
    expect(page).to have_xpath("//img[contains(@src,'padme.jpg')]")
  end

  scenario 'succesfully without a photo' do
    pet = build(:pet)
    create(:user)

    login

    visit new_pet_path

    fill_in 'pet[owner]', with: pet.owner
    fill_in 'pet[name]', with: pet.name
    select pet.species, from: 'pet[species]'
    fill_in 'pet[breed]', with: pet.breed
    select pet.gender, from: 'pet[gender]'
    select '2016', from: 'pet[birth_date(1i)]'
    select 'August', from: 'pet[birth_date(2i)]'
    select '1', from: 'pet[birth_date(3i)]'
    fill_in 'pet[address]', with: pet.address

    click_on 'Registrar pet'

    expect(page).to have_content pet.owner
    expect(page).to have_content pet.name
    expect(page).to have_content pet.species
    expect(page).to have_content pet.breed
    expect(page).to have_content pet.gender
    expect(page).to have_content pet.birth_date.strftime('%d/%m/%Y')
    expect(page).to have_content pet.address
  end

  scenario "can't register a new pet without the required fields" do
    create(:user)

    login

    visit new_pet_path

    click_on 'Registrar pet'

    expect(current_path).to eq pets_path
    expect(page).to have_content 'Campo obrigatório'
  end

  scenario "can't create a new pet without being logged in" do
    visit new_pet_path

    expect(current_path).to eq new_user_session_path
  end
end
