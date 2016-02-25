module ModelsMacros
  def login
    visit new_user_session_path

    fill_in 'user[email]', with: 'joaorsalmeida@testmail.com'
    fill_in 'user[password]', with: 'padme123'

    within('form.new_user') do
      find('input[type=submit]').click
    end
  end
end
