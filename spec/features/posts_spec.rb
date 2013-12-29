require 'spec_helper'

describe 'Post' do
  it 'displays posts' do
    post1 = FactoryGirl.create(:post)

    visit posts_path
    expect(page).to have_content post1.title
    expect(page).to have_content post1.body
  end
end
