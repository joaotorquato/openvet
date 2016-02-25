require 'rails_helper'

feature 'User register a new revaccination' do
  scenario 'succesfully' do
    pet = create(:pet)
    vaccination = create(:vaccination, pet: pet, vaccination_date: Date.current)

    login

    visit pet_path pet

    fill_in 'vaccination[vaccine_attributes][name]',
            with: vaccination.vaccine.name
    select '2016', from: 'vaccination[vaccination_date(1i)]'
    select 'August', from: 'vaccination[vaccination_date(2i)]'
    select '1', from: 'vaccination[vaccination_date(3i)]'
    select '2016', from: 'vaccination[expiration_date(1i)]'
    select 'December', from: 'vaccination[expiration_date(2i)]'
    select '16', from: 'vaccination[expiration_date(3i)]'

    fill_in 'vaccination[veterinary]', with: 'Dr. Dolittle'

    click_on 'Registrar vacinação'
    expect(page).to have_content vaccination.vaccine.name
    expect(page).to have_xpath "//*[normalize-space()='01/08/2016']"
    expect(page).to have_xpath "//*[normalize-space()='16/12/2016']"
    expect(page).to have_content 'Dr. Dolittle'
    expect(Vaccine.count).to eq 1
    expect(Vaccination.count).to eq 2
  end
end
