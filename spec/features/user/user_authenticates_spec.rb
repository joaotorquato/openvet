require 'rails_helper'

feature 'User authenticates' do
  scenario 'succesfully' do
    user = create(:user)

    visit root_path

    click_on "Entrar"

    fill_in "email", with: "joaorsalmeida@testmail.com"
    fill_in "password", with: "padme123"

    click_on "Login"

    expect(page).to have_content "Olá, #{user.email}"
    expect(page).to have_link 'Sair'
    expect(page).not_to have_link 'Entrar'
  end
end
