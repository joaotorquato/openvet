require 'rails_helper'

feature 'User register a new pet' do
  scenario 'succesfully' do
    visit new_pet_path

    fill_in 'pet[owner]', with: 'João Almeida'
    fill_in 'pet[name]', with: 'Padmé'
    select 'Gato', from: 'pet[species]'
    fill_in 'pet[breed]', with: 'SRD'
    fill_in 'pet[gender]', with: 'Feminino'
    select '2016', from: 'pet[birth_date(1i)]'
    select 'August', from: 'pet[birth_date(2i)]'
    select '1', from: 'pet[birth_date(3i)]'
    fill_in 'pet[address]', with: 'Alameda Santos, 1293'
    # attach_file('/spec/files/Padme.jpg', 'file')

    click_on 'Registrar pet'

    expect(page).to have_content 'João Almeida'
    expect(page).to have_content 'Padmé'
    expect(page).to have_content 'Gato'
    expect(page).to have_content 'SRD'
    expect(page).to have_content 'Feminino'
    expect(page).to have_content '2016'
    expect(page).to have_content '01'
    expect(page).to have_content '08'
    expect(page).to have_content 'Alameda Santos, 1293'
    # expect(page).to have_xpath "//*[@*='Padme']"
  end

  # scenario 'unsuccesfully' do
  #
  #   visit new_pet_path
  #
  #   click_on 'Registrar pet'
  #
  #   all(:xpath, "//*[normalize-space()='Campo obrigatório']").count == 7
  # end
end
