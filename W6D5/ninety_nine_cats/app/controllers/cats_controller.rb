class CatsController < ApplicationController
    def index
        # render json: Cat.all
        @cats = Cat.all
        render :index
    end

    def show
        # render json: Cat.find(params[:id])
        @cat = Cat.find(params[:id])
        render :show
    end
    
    def new
        @cat = Cat.new
        render :new
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat.id)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @cat = Cat.find(params[:id])
        render :edit
    end

    def update
        new_info = Cat.find(params[:id])
        if new_info.update_attributes(cat_params)
            redirect_to cat_url(params[:id])
        else
            render :edit, status: :unprocessable_entity
        end
    end
    private
    def cat_params
        params.require(:cat).permit(:birth_date, :name, :color, :sex, :description)
    end
end