module ModelsMacros
  def login
    visit new_user_session_path

    fill_in 'user[email]', with: 'joaorsalmeida@testmail.com'
    fill_in 'user[password]', with: 'padme123'

    click_on 'Login'
  end
end
