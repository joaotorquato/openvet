require 'rails_helper'

feature 'User authenticates' do
  scenario 'succesfully' do
    user = create(:user)

    visit root_path

    click_on "Entrar"

    fill_in "user[email]", with: "joaorsalmeida@testmail.com"
    fill_in "user[password]", with: "padme123"

    click_on "Login"

    expect(page).to have_content "Olá, #{user.email}"
    expect(page).to have_link 'Sair'
    expect(page).not_to have_link 'Entrar'
  end

  scenario 'user sign out succesfully' do
    user = create(:user)

    visit new_user_session_path

    fill_in "user[email]", with: "joaorsalmeida@testmail.com"
    fill_in "user[password]", with: "padme123"

    click_on "Login"

    click_on "Sair"

    expect(page).to have_content "Entrar"
    expect(page).not_to have_content "Sair"
    expect(page).not_to have_content "Olá, #{user.email}"

  end
end
