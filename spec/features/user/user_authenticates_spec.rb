require 'rails_helper'

feature 'User authenticates' do
  scenario 'succesfully' do
    create(:user)

    visit root_path

    within('.navbar') do
      click_on 'Entrar'
    end

    fill_in 'user[email]', with: 'joao.otl@gmail.com'
    fill_in 'user[password]', with: 'padme123'

    within('form.new_user') do
      find('input[type=submit]').click
    end

    expect(page).to have_content "Olá, João Almeida"
    expect(page).to have_link 'Sair'
    expect(page).not_to have_link 'Entrar'
  end

  scenario 'user sign out succesfully' do
    create(:user)

    login

    click_on 'Sair'

    expect(page).to have_content 'Entrar'
    expect(page).not_to have_content 'Sair'
    expect(page).not_to have_content "Olá, João Almeida"
  end

  scenario 'user register a new account without all the required params' do
    visit new_user_registration_path

    fill_in 'user[email]', with: 'joaorsalmeida@testmail.com'
    fill_in 'user[password]', with: 'padme123'

    within('form.new_user') do
      find('input[type=submit]').click
    end

    expect(page).to have_content 'Alguns erros foram encontrados,
                                  por favor verifique:'
    expect(page).to have_content 'não pode ficar em branco'
  end

  scenario 'user register a new account with all required params' do
    visit new_user_registration_path

    fill_in 'user[email]', with: 'joaorsalmeida@testmail.com'
    fill_in 'user[password]', with: 'padme123'
    fill_in 'user[password_confirmation]', with: 'padme123'
    fill_in 'user[name]', with: "João Almeida"
    fill_in 'user[phone]', with: '5555-5555'

    within('form.new_user') do
      find('input[type=submit]').click
    end

    expect(page).to have_content "Olá, João Almeida"
  end
end
