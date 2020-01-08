class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:session_token] = @user.session_token
            flash[:success] = "Welcome to Music App! Account created successfully"
            redirect_to users_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        render :show
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
