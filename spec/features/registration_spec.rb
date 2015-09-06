require 'rails_helper'

describe 'User registration' do
  it do
    # ユーザー登録画面に遷移
    visit root_path
    click_link 'ユーザー登録する'

    uri = URI.parse(current_url)
    expect(uri.path).to eq new_user_path
    expect(page).to have_content('メールアドレスとパスワードを入力して下さい')

    # フォームに何も入れずにユーザ登録実施
    click_button 'ユーザー登録する'

    expect(page).to have_content('パスワード は３文字以上で入力して下さい')
    expect(page).to have_content('パスワード（確認） を入力して下さい')
    expect(page).to have_content('E-mailアドレス を入力して下さい')

    # ユーザー登録実施
    fill_in 'user_email', with: 'hoge@fuga.com'
    fill_in 'user_password', with: 'pass'
    fill_in 'user_password_confirmation', with: 'pass'
    click_button 'ユーザー登録する'

    uri = URI.parse(current_url)
    expect(uri.path).to eq timeline_path
    expect(page).to have_content('ログインしました')
  end
end