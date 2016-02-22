require 'rails_helper'

feature 'User view all listed pets' do
  scenario 'succesfully' do
    create(:user)
    create(:pet)
    create(:pet2)

    login

    visit pets_path

    # Pet 1
    expect(page).to have_content "Padmé"
    expect(page).to have_content 'Gato'
    expect(page).to have_content 'SRD'
    expect(page).to have_content 'F'
    expect(page).to have_content '01/08/2016'
    expect(page).to have_xpath "//*[@*='Padme']"
    # Pet 2
    expect(page).to have_content 'Pet'
    expect(page).to have_content 'Cachorro'
    expect(page).to have_content 'Poodle'
    expect(page).to have_content 'M'
    expect(page).to have_content '01/07/2016'
    expect(page).to have_xpath "//*[@*='Missing']"
  end
end
