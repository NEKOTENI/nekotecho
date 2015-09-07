require 'rails_helper'

describe 'メモを登録する' do
  let(:user) { create(:user, password: 'password', password_confirmation: 'password') }
  let!(:tag1) { create(:tag, user_id: user.id, tag: 'タグ1') }
  let!(:tag2) { create(:tag, user_id: user.id, tag: 'タグ2') }

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
    check("tag_#{tag1.id}")
    click_button '投稿する'

    #puts page.body
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
    check("tag_#{tag2.id}")
    click_button '投稿する'

    # メモ作成後、timeline_pathに遷移して、「メモ２」&「タグ２」のメモが作られているかどうか
    uri = URI.parse(current_url)
    expect(uri.path).to eq timeline_path
    expect(page).to have_content('メモ2')
    expect(page).to have_content('タグ2')

    # <====== ここまではcreate_memo_spec.rbと同じ内容（ってことはcreate_memo_spec.rbっていらない？（汗）

    # タグリストのタグ1をクリックして、メモ2とタグ2 がtimeline上に表示されないことを確認
    within('.tag_list_container') do
      click_link 'タグ1'
    end
    within('.main_content') do
      expect(page).to have_content('メモ1')
      expect(page).to have_content('タグ1')
      expect(page).not_to have_content('メモ2')
      expect(page).not_to have_content('タグ2')
    end

    # タグリストのタグ2をクリックして、メモ1とタグ1 がtimeline上に表示されないことを確認
    within('.tag_list_container') do
      click_link 'タグ2'
    end
    within('.main_content') do
      expect(page).to have_content('メモ2')
      expect(page).to have_content('タグ2')
      expect(page).not_to have_content('メモ1')
      expect(page).not_to have_content('タグ1')
    end

    # タグリストのすべてをクリックして、メモ1&タグ1、メモ2&タグ2 がtimeline上に表示されていることを確認
    click_link 'すべて'
    expect(page).to have_content('メモ1')
    expect(page).to have_content('タグ1')
    expect(page).to have_content('メモ2')
    expect(page).to have_content('タグ2')
  end
end