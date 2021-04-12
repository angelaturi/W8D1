class SubsController < ApplicationController

    before_action :sub_creator?, only: [:edit, :update]
    before_action :ensure_logged_in, except: [:show, :index]

    def index
        @subs = Sub.all
        render :index
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id

        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end
    
    def new
        @sub = Sub.new
        render :new
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub.update(sub_params) && current_user.id == @sub.moderator_id
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end

    def sub_creator?
        current_user.subs.find_by(id: params[:id])
    end

end