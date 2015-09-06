require 'rails_helper'

describe 'login' do
  let(:user) { create(:user, password: 'password', password_confirmation: 'password') }

  it do
    visit root_path

    click_link 'ログインする'
    expect(page).to have_content('メールアドレスとパスワードを入力して下さい')

    fill_in 'email', with: user.email
    fill_in 'password', with: 'password'
    click_button 'ログイン'

    uri = URI.parse(current_url)
    expect(uri.path).to eq timeline_path
    expect(page).to have_content('ログインしました')
  end
end