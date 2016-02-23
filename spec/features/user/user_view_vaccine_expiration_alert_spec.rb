require 'rails_helper'

feature 'User view vaccine expiration alert' do
  scenario 'on index' do
    create(:user)
    create(:pet)

    login

    visit root_path

    expect(page).to have_content 'Vacina Tripla expira em 15 dias'
  end
end
