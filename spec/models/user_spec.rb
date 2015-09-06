require 'rails_helper'

describe User do
  # 自動生成されたものを一旦コメントアウトしておく
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:user) { User.new }

  describe 'validation' do
    describe 'email' do
      it { expect(user).to validate_presence_of(:email) }
      it { expect(user).to validate_uniqueness_of(:email) }
    end

    describe 'password' do
      it { expect(user).to validate_length_of(:password).is_at_least(3) }
    end

    describe 'password_confirmation' do
      it { expect(user).to validate_presence_of(:password_confirmation) }
    end
  end
end