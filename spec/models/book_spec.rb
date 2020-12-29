require 'rails_helper'

RSpec.describe Book, type: :model do
    context 'valid' do
      it 'create by factory' do
        expect(create(:book)).to be_valid
      end
    end

    context 'validations' do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:description) }
      it { should validate_uniqueness_of(:title) }
    end

end
