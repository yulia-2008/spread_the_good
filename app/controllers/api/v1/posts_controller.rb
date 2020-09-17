class Api::V1::PostsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

        def index
          @posts = Post.all 
          render json: @posts, include: [:comments]
        end

        def show 
          @post = Post.find_by(id:params[:id])
          render json: @post, include: [:comments]
        end

        def create
          @post = Post.create(post_params)
            render json: @post
            #{ post: PostSerializer.new(@post), jwt: @token }, status: :created
        end

        def destroy 
          @post = Post.find_by(id:params[:id])
          @post.destroy
        end
       
        private
       
        def post_params
          params.require(:post).permit(:title, :user_id, :descriprion, :active, :image)
        end
end
# delete post_params: active