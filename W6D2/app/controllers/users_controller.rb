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
        render json: User.all
    end

    def create
        user = User.new(user_params)

        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])

        if user.update(user_params)
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