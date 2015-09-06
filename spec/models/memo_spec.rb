require 'rails_helper'

describe Memo do

  let(:memo) { Memo.new }

  describe 'validation' do
    describe 'ねこメモ' do
      it { expect(memo).to validate_presence_of(:text) }
    end

    describe 'user_id' do
      it { expect(memo).to validate_presence_of(:user_id)}
    end
  end
end