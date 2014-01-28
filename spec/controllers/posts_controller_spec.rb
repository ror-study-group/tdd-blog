require 'spec_helper'
require 'pry'

describe PostsController do
  before :each do
    @post = create :post
  end

  describe 'GET index' do
    it 'assign posts to an instance variable' do
      get :index
      expect(assigns(:posts)).to_not be_nil
    end
  end

  describe 'GET show' do
    it 'assign posts to an instance variable' do
      get :show, id: @post.id
      expect(assigns(:post)).to_not be_nil
    end
  end

  describe 'GET new' do
    it 'assigns a new post to an instance variable' do
      get :new
      expect(assigns(:post)).to_not be_nil
    end
  end

  describe 'POST create' do
    it 'adds a post to the database' do
      expect { post :create, post: attributes_for(:post)}.to change(Post, :count).by(1)
    end

    it 'redirects to the show page' do
      post :create, post: attributes_for(:post)
      expect(response).to redirect_to post_path(Post.last)
    end
  end

  describe 'GET edit' do
    it 'assigns a new post to an instance variable' do
      get :edit, id: @post.id
      expect(assigns(:post)).to_not be_nil
    end
  end

  describe 'PATCH update' do
    it 'redirects to newly added post' do
      patch :update, id: @post.id, post: attributes_for(:post).merge(title: 'foo', body: 'bar')
      expect(response).to redirect_to post_path(@post)
    end
  end
end
