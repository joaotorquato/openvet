require 'rails_helper'

feature 'User view vaccination expired alert' do
  scenario 'on index' do
    create(:vaccination, vaccination_date: Time.zone.now,
                         expiration_date: 5.days.ago)

    login

    visit pets_path

    expect(page).to have_content 'Vacina Tripla expirou há 5 dias'
  end

  scenario 'on show' do
    create(:vaccination, vaccination_date: Time.zone.now,
                         expiration_date: 20.days.ago)

    login

    visit pet_path(1)

    expect(page).to have_content 'Vacina Tripla expirou há 20 dias'
  end
end
