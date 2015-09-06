require 'rails_helper'

describe 'メモを登録する' do
  let(:user) { create(:user, password: 'password', password_confirmation: 'password') }
  let!(:tag1) { Tag.create(user_id: user.id, tag: 'タグ1') }
  let!(:tag2) { Tag.create(user_id: user.id, tag: 'タグ2') }

  it do
    # トップページに行く_
    visit root_path

    # ログインする
    click_link 'ログインする'
    fill_in 'email', with: user.email
    fill_in 'password', with: 'password'
    click_button 'ログイン'

    # ログイン後、timeline_pathに遷移するかどうか
    uri = URI.parse(current_url)
    expect(uri.path).to eq timeline_path
    expect(page).to have_content('タグ1')
    expect(page).to have_content('タグ2')

    # メモ投稿ページに遷移するかどうか
    click_link 'メモを投稿する'
    expect(page).to have_content('投稿する')

    # 「メモ１」という内容のメモを作成する
    fill_in 'text', with: 'メモ1'
    find(:css, "#tag_id_[value='#{tag1.id}']").set(true)
    click_button '投稿する'

    # メモ作成後、timeline_pathに遷移して、「メモ１」&「タグ１」のメモが作られているかどうか
    uri = URI.parse(current_url)
    expect(uri.path).to eq timeline_path
    expect(page).to have_content('メモ1')
    expect(page).to have_content('タグ1')

    # メモ投稿ページに遷移するかどうか
    click_link 'メモを投稿する'
    expect(page).to have_content('投稿する')

    # 「メモ２」という内容のメモを作成する
    fill_in 'text', with: 'メモ2'
    find(:css, "#tag_id_[value='#{tag2.id}']").set(true)
    click_button '投稿する'

    # メモ作成後、timeline_pathに遷移して、「メモ２」&「タグ２」のメモが作られているかどうか
    uri = URI.parse(current_url)
    expect(uri.path).to eq timeline_path
    expect(page).to have_content('メモ2')
    expect(page).to have_content('タグ2')
  end
end