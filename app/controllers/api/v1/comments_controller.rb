class Api::V1::CommentsController < ApplicationController
    skip_before_action :authorized, only: [ :index, :create]

        def index
          @comments = Comment.all 
          render json: @comments, include: [:user]
          #render :json => @comments, :include => [:user, :comments => {:include => [:user]}]
        end

        def show 
          @comment = Comment.find_by(id:params[:id])
          render json: @comment, include: [:user]
        end

        def create
          @comment = Comment.create(c_params)
            render json: @comment
        end

        def destroy 
          @comment = Comment.find_by(id:params[:id])
          @comment.destroy
        end
       
        private
       
        def c_params
          params.require(:comment).permit(:post_id,  :user_id, :text)
        end
end
#delete or comment destroy index, show
