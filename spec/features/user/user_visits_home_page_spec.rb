require 'rails_helper'

feature 'User visits home page' do

  scenario 'Successfully' do

    visit root_path

    within 'section#about' do
      expect(page).to have_content 'Como Funciona?'
    end
  end
end
