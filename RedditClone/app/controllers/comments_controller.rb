class CommentsController < ApplicationController

    before_action :ensure_logged_in, only: [:new, :create]

    def create
        @comment = Comment.new(comment_params)
        @comment.author_id = current_user.id

        if @comment.save
            redirect_to post_url(@comment.post_id)
        else
            flash[:errors] = @comment.errors.full_messages
            redirect_to new_post_comment_url(@comment.post_id)
        end
    end

    def new
        @comment = Comment.new(post_id: params[post_id])
    end

    def show
        @comment = Comment.find(params[:id])
        render :show
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end