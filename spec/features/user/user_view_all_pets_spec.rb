require 'rails_helper'

feature 'User view all listed pets' do
  scenario 'succesfully' do
    create(:user)
    create(:pet)
    create(:pet2)

    login

    visit pet_path

    # Pet 1
    expect(page).to have_content "Padmé"
    expect(page).to have_content 'Gato'
    expect(page).to have_xpath "//*[@*='Padme']"
    # Pet 2
    expect(page).to have_content 'Pet'
    expect(page).to have_content 'Cachorro'
  end
end
