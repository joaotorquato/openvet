require 'rails_helper'

feature 'User authenticates' do
  scenario 'succesfully' do
    pet = create(:pet)

    visit new_pet_path

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
end
