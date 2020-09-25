class Api::V1::PostsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

        def index
          @posts = Post.all 
          render json: @posts, include: [:user, :comments ]
          # user -  who wrote post
        end

        def show 
          @post = Post.find_by(id:params[:id])
          render json: @post, include: [:comments, :users]
          #users - who wrote comments
        end

        def create
          @post = Post.create(post_params)
            render json: @post
          
        end
        
        
         def update 
         
         @post = Post.find_by(id:params[:id])
         @post.update(post_params)
         render json: @post
         end
 

        def destroy 
          @post = Post.find_by(id:params[:id])
          @post.destroy
        end
       
        private
       
        def post_params
          params.require(:post).permit(:title, :helper_id, :user_id, :description, :active, :image)
        end
end
# delete post_params: active