require 'rails_helper'

describe Vaccination do
  describe 'expires on 15 days' do
    it 'equals true' do
      vaccination = build(:vaccination, expiration_date: 15.days.from_now)
      expect(vaccination.to_expire?).to eq true
    end
  end

  describe 'does not expires on 16 days' do
    it 'equals false' do
      vaccination = build(:vaccination, expiration_date: 16.days.from_now)
      expect(vaccination.to_expire?).to eq false
    end
  end

  describe 'expires on 14 days' do
    it 'equals true' do
      vaccination = build(:vaccination, expiration_date: 14.days.from_now)
      expect(vaccination.to_expire?).to eq true
    end
  end
end
