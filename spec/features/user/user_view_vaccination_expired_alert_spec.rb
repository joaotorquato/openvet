require 'rails_helper'

feature 'User view vaccination expired alert' do
  scenario 'on index' do
    create(:vaccination, vaccination_date: Time.zone.now,
                         expiration_date: 5.days.ago)

    login

    visit root_path

    expect(page).to have_content 'Vacina Tripla expirou há 5 dias'
  end

  context 'on show' do
    scenario 'user should see expiration alert' do
      create(:vaccination, vaccination_date: Time.zone.now,
                           expiration_date: 20.days.ago)

      login

      visit pet_path(1)

      expect(page).to have_content 'Vacina Tripla expirou há 20 dias'
    end

    scenario 'user should see expiration alert only in the last vaccination' do
      user = create(:user)
      pet = create(:pet, user: user)

      create(:vaccination, vaccination_date: Time.zone.now,
                           expiration_date: 20.days.ago,
                           pet: pet)

      create(:vaccination, vaccination_date: Time.zone.now,
                           expiration_date: 10.days.ago,
                           pet: pet)

      login

      visit pet_path(1)

      expect(page).not_to have_content 'Vacina Tripla expirou há 20 dias'
      expect(page).to have_content 'Vacina Tripla expirou há 10 dias'
    end

    scenario 'user should see alerts as an highlight field' do
      user = create(:user)
      pet = create(:pet, user: user)

      vaccination1 = create(:vaccination, vaccination_date: Time.zone.now,
                                          expiration_date: 20.days.ago,
                                          pet: pet)

      vaccination2 = create(:vaccination, vaccination_date: Time.zone.now,
                                          expiration_date: 10.days.ago,
                                          pet: pet)

      login

      visit pet_path(1)

      expect(page.has_css?("#pet-vaccination-#{vaccination1.id}.danger"))
        .to be false
      expect(page.has_css?("#pet-vaccination-#{vaccination2.id}.danger"))
        .to be true
    end
  end
end
