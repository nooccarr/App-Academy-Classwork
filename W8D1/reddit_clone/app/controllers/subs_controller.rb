class SubsController < ApplicationController
    before_action :ensure_logged_in, only: [:edit]


    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        
    end

    def edit
        @sub = Sub.find_by(id: params[:id])

    end

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end

