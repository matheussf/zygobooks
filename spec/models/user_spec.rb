require 'rails_helper'

RSpec.describe User, type: :model do
    context 'valid' do
      it 'create by factory' do
        expect(create(:user)).to be_valid
      end
    end

    context 'validations' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
      it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    end

end
