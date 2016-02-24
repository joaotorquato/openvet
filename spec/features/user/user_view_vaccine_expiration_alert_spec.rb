require 'rails_helper'

feature 'User view vaccine expiration alert' do
  scenario 'on index' do

    travel_to 18.days.ago do
      create(:vaccination, vaccination_date: Time.zone.now,
                           expiration_date: 30.days.from_now)
    end

    login

    visit root_path
    binding.pry
    expect(page).to have_content 'Vacina Tripla expira em 12 dias'
  end

  scenario 'on show' do

    travel_to 18.days.ago do
      create(:vaccination, vaccination_date: Time.zone.now,
                           expiration_date: 30.days.from_now)
    end

    login

    visit pet_path(1)

    expect(page).to have_content 'Vacina Tripla expira em 12 dias'
  end
end
