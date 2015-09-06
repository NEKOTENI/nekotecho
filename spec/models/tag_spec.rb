require 'rails_helper'

describe Tag do

  let(:tag) { Tag.new }

  describe 'validation' do
    describe 'タグ名' do
      it { expect(tag).to validate_presence_of(:tag) }
    end

    describe 'user_id' do
      it { expect(tag).to validate_presence_of(:user_id)}
    end
  end
end
