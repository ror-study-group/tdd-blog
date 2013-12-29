require 'spec_helper'
require 'pry'

describe PostsController do
  describe 'GET index' do
    it 'return http success' do
      get :index
      expect(response).to be_success
    end

    it 'assign posts to an instance variable' do
      get :index
      expect(assigns(:posts)).to_not be_nil
    end
  end
end
