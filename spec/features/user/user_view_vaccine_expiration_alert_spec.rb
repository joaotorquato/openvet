require 'rails_helper'

feature 'User view vaccine expiration alert' do
  scenario 'on index' do
    create(:vaccination, vaccination_date: Time.zone.now,
                         expiration_date: 10.days.from_now)

    login

    visit pets_path

    expect(page).to have_content 'Vacina Tripla expira em 10 dias'
  end

  scenario 'on show' do
    create(:vaccination, vaccination_date: Time.zone.now,
                         expiration_date: 15.days.from_now)

    login

    visit pet_path(1)

    expect(page).to have_content 'Vacina Tripla expira em 15 dias'
  end
end
