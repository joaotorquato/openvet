require 'rails_helper'

describe Vaccination do
  it '#build_vaccination' do
    params = { vaccine_attributes: { name: 'Tripla' },
               expiration_date: '12/12/2013',
               veterinary: 'Dr Dolittle', vaccination_date: '12/12/2010' }
    pet = create(:pet)
    vaccination = described_class.build_vaccination(pet, params)
    expect(vaccination).to be_valid
    expect(vaccination.pet).to eq pet
    expect(vaccination.vaccine).to be_persisted
    expect(vaccination.vaccine.name).to eq 'Tripla'
  end
  describe 'expires on 15 days' do
    it 'equals true' do
      vaccination = build(:vaccination, expiration_date: 15.days.from_now)
      expect(vaccination.to_expire?).to eq true
    end
  end

  describe 'expires on 16 days' do
    it 'equals false' do
      vaccination = build(:vaccination, expiration_date: 16.days.from_now)
      expect(vaccination.to_expire?).to eq false
    end
  end

  describe 'is going to expire' do
    it 'equals true' do
      vaccination = build(:vaccination, expiration_date: 14.days.from_now)
      expect(vaccination.to_expire?).to eq true
    end
  end

  describe 'is already expired 1 day after it reaches the expiration date' do
    it 'equals true' do
      vaccination = build(:vaccination, expiration_date: 1.day.ago)
      expect(vaccination.expired?).to eq true
    end
  end

  describe 'is already expired 1 day before it reaches the expiration date' do
    it 'equals false' do
      vaccination = build(:vaccination, expiration_date: 1.day.from_now)
      expect(vaccination.expired?).to eq false
    end
  end

  describe 'is already expired the day it reaches the expiration date' do
    it 'equals false' do
      vaccination = build(:vaccination, expiration_date: Time.zone.now)
      expect(vaccination.expired?).to eq false
    end
  end

  describe 'expires on 14' do
    it 'equals true' do
      vaccination = build(:vaccination, expiration_date: 14.days.from_now)
      expect(vaccination.expiration_days).to eq 14
    end
  end

  describe 'expired 15 days ago' do
    it 'equals true' do
      vaccination = build(:vaccination, expiration_date: 15.days.ago)
      expect(vaccination.expired_days).to eq 15
    end
  end
end
