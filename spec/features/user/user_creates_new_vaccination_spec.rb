require 'rails_helper'

feature 'User register a new vaccination' do
  scenario 'succesfully' do
    create(:pet)

    login

    visit new_vaccination_path

    fill_in 'vaccination[name]', with: 'Triple'
    select '2016', from: 'vaccination[vaccination_date(1i)]'
    select 'August', from: 'vaccination[vaccination_date(2i)]'
    select '1', from: 'vaccination[vaccination_date(3i)]'
    select '2016', from: 'vaccination[expiration_date(1i)]'
    select 'August', from: 'vaccination[expiration_date(2i)]'
    select '16', from: 'vaccination[expiration_date(3i)]'
    fill_in 'vaccination[veterinary]', with: 'Dr. Dolittle'

    click_on 'Registrar vacinação'

    expect(page).to have_content 'Triple'
  end
end
