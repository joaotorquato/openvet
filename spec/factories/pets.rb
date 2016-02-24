FactoryGirl.define do
  factory :pet do
    owner 'João Almeida'
    name 'Padmé'
    species 'Gato'
    breed 'SRD'
    gender 'F'
    birth_date '01/08/2016'
    address 'Alameda Santos, 1293asd'
    user
    photo do
      File.new("#{Rails.root}/spec/images/pets/padme.jpg")
    end
  end
end
