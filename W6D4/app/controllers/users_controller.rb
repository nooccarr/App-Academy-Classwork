require "byebug"
# get 'users', to: 'users#index', as: 'users'
# post 'users', to: 'users#create'
# get 'users/new', to: 'users#new', as: 'new_user'
# get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
# get 'users/:id', to: 'users#show', as: 'user'
# patch 'users/:id', to: 'users#update'
# put 'users/:id', to: 'users#update'
# delete 'users/:id', to: 'users#destroy'

class UsersController < ApplicationController

    def index
        if params[:username]
            user = User.where("username like '%#{params[:username]}%'")
            render json: user
        else
            render json: User.all
        end
    end

    def create
        debugger
        user = User.new(user_params)

        if user.save #instance model method
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id]) # User.find_by( id: params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id]) # class model method
        
        if user.update(user_params) # instance model method

            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end