require 'rails_helper'

#    Prefix Verb   URI Pattern               Controller#Action
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy

RSpec.describe UsersController, type: :controller do
  subject(:user) do
    User.create!(
      email: 'kwjen@gmail.com',
      password: 'j3nrg43'
    )
  end

  describe "GET #index" do
    it "renders the index template" do 
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do 
    it 'renders the show template' do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'renders the new users template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
