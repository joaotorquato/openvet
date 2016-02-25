require 'rails_helper'

feature 'User register a new vaccination' do
  scenario 'succesfully' do
    pet = create(:pet)

    login

    visit pet_path pet

    fill_in 'vaccination[vaccine_attributes][name]', with: 'Tripla'
    select '2016', from: 'vaccination[vaccination_date(1i)]'
    select 'Agosto', from: 'vaccination[vaccination_date(2i)]'
    select '1', from: 'vaccination[vaccination_date(3i)]'
    select '2016', from: 'vaccination[expiration_date(1i)]'
    select 'Julho', from: 'vaccination[expiration_date(2i)]'
    select '16', from: 'vaccination[expiration_date(3i)]'

    fill_in 'vaccination[veterinary]', with: 'Dr. Dolittle'

    within('form.new_vaccination') do
      find('input[type=submit]').click
    end

    expect(page).to have_content 'Tripla'
    expect(page).to have_xpath "//*[normalize-space()='01/08/2016']"
    expect(page).to have_xpath "//*[normalize-space()='16/07/2016']"
    expect(page).to have_content 'Dr. Dolittle'
  end

  scenario 'unsuccessfuly' do
    pet = create(:pet)

    login

    visit pet_path pet

    within('form.new_vaccination') do
      find('input[type=submit]').click
    end

    %w(vaccine_name veterinary).each do |field|
      within(".vaccination_#{field}") do
        expect(page).to have_content "não pode ficar em branco"
      end
    end
  end
end
