require 'rails_helper'

feature 'User view vaccination expired alert' do
  scenario 'on index' do
    travel_to 20.days.ago do
      create(:vaccination, vaccination_date: Time.zone.now,
                           expiration_date: 15.days.from_now)
    end

    login

    visit root_path

    expect(page).to have_content 'Vacina Tripla expirou há 5 dias'
  end

  scenario 'on show' do
    travel_to 20.days.ago do
      create(:vaccination, vaccination_date: Time.zone.now,
                           expiration_date: 15.days.from_now)
    end

    login

    visit pet_path(1)

    expect(page).to have_content 'Vacina Tripla expirou há 5 dias'
  end
end
