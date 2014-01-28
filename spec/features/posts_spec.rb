require 'spec_helper'

feature 'Post' do
  before :each do
    @post1 = create(:post)
    @post2 = create(:post)
  end
    
  scenario 'displays all posts' do
    visit posts_path
    expect(page).to have_content @post1.title
    expect(page).to have_content @post1.body
    expect(page).to have_content @post2.title
    expect(page).to have_content @post2.body
  end

  scenario 'displays individual post' do
    visit post_path(@post1.id)
    expect(page).to have_content @post1.title
    expect(page).to have_content @post1.body
  end

  scenario 'creates a new post' do
    post_attributes = attributes_for :post
    visit new_post_path
    fill_in 'Title', with: post_attributes[:title]
    fill_in 'Body', with: post_attributes[:body]
    click_button 'Create Post'
    expect(page).to have_content "Post"
  end

  scenario 'displays the edit page' do
    visit edit_post_path(@post1)
    expect(page).to have_xpath "//input[contains(@value, '#{@post1.title}')]"
    expect(page).to have_content @post1.body #TODO: Change to xpath
  end

  scenario 'updates a post' do
    visit edit_post_path(@post1)
    fill_in 'Title', with: 'Wiggly'
    fill_in 'Body', with: 'Ton'
    click_button 'Update Post'
    expect(page).to have_content 'Wiggly'
    expect(page).to have_content 'Ton'
  end
end
