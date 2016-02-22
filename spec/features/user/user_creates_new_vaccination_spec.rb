require 'rails_helper'

feature 'User register a new vaccination' do
  scenario 'succesfully' do
    create(:user)
    create(:pet)

    login

    visit new_vaccination_path

    fill_in 'vaccination[name]', with: 'Triple'
    select '2016', from: 'vaccination[vaccination_date(1i)]'
    select 'August', from: 'vaccination[vaccination_date(2i)]'
    select '1', from: 'vaccination[vaccination_date(3i)]'
    fill_in 'vaccination[expiration_date]', with: 15.days.from_now
    fill_in 'vaccination[veterinary]', with: 'Dr. Dolittle'

    click_on 'Registrar vacinação'

    expect(page).to have_content 'Triple'
  end
end
