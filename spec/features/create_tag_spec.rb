require 'rails_helper'

describe 'タグを作る' do
  let(:user) { create(:user, password: 'password', password_confirmation: 'password') }

  it do
    # トップページに行く
    visit root_path

    # ログインする
    click_link 'ログインする'
    fill_in 'email', with: user.email
    fill_in 'password', with: 'password'
    click_button 'ログイン'

    # ログイン後、timeline_pathに遷移するかどうか
    uri = URI.parse(current_url)
    expect(uri.path).to eq timeline_path
    expect(page).not_to have_content('にくきゅう')

    # タグ作成ページに遷移するかどうか
    click_link 'タグを作る'
    expect(page).to have_content('タグを作成する')

    # にくきゅうという名前のタグを作成する
    fill_in 'tag', with: 'にくきゅう'
    click_button '作成する'

    # タグ作成後、timeline_pathに遷移して、にくきゅうタグが作られているかどうか
    uri = URI.parse(current_url)
    expect(uri.path).to eq timeline_path
    expect(page).to have_content('にくきゅう')
  end
end