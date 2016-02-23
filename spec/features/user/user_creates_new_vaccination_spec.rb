require 'rails_helper'

feature 'User register a new vaccination' do
  scenario 'succesfully' do
    create(:user)
    pet = create(:pet)

    login

    visit pet_path pet

    fill_in 'vaccination[name]', with: 'Triple'
    select '2016', from: 'vaccination[vaccination_date(1i)]'
    select 'August', from: 'vaccination[vaccination_date(2i)]'
    select '1', from: 'vaccination[vaccination_date(3i)]'
    fill_in 'vaccination[expiration_date]', with: 15
    fill_in 'vaccination[veterinary]', with: 'Dr. Dolittle'

    click_on 'Registrar vacinação'
    expect(page).to have_content 'Triple'
    expect(page).to have_xpath "//*[normalize-space()='01/08/2016']"
    expect(page).to have_content 15
    expect(page).to have_content 'Dr. Dolittle'
  end

  scenario 'unsuccessfuly' do
    create(:user)
    pet = create(:pet)

    login

    visit pet_path pet

    click_on 'Registrar vacinação'
    %w(name expiration_date veterinary).each do |field|
      within(".vaccination_#{field}") do
        expect(page).to have_content "Campo obrigatório"
      end
    end
  end
end
