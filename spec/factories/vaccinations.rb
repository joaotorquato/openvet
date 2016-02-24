FactoryGirl.define do
  factory :vaccination do
    name 'Tripla'
    vaccination_date '2016-02-22'
    expiration_date '2016-03-08'
    veterinary 'Dr. Dolittle'
    pet
  end
end
