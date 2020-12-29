require 'rails_helper'

RSpec.describe Book, type: :model do
    context 'valid' do
      it 'create by factory' do
        expect(create(:blog)).to be_valid
      end
    end

    context 'validations' do
      it { should validate_presence_of(:url) }
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:resume) }
      it { should validate_presence_of(:text) }
      it { should validate_uniqueness_of(:url) }
      it { should validate_uniqueness_of(:title) }
    end

end
