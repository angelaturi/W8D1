class PostsController < ApplicationController
    before_action :post_creator?, only: [:edit, :update, :destroy]
    before_action :ensure_logged_in, except: [:show]

    def post_creator?
        current_user.posts.find_by(id: params[:id])
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id

        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def new
        @post = Post.new
        render :new
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    def show
        @post = Post.find_by(id: params[:id])
        render :show
    end

    def update
        @post = Post.find_by(id: params[:id])
        
        if @post.update && current_user.id == @post.author_id
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        if current_user == @post.author_id
            @post.destroy
            redirect_to subs_url
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end
    
end