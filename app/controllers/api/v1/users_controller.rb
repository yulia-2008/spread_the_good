class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :profile, :show, :gethelpers]
 
  def index
    @users = User.all 
    render json: @users
  end

  def show 
   
    @user = User.find_by(id:params[:id])
    render json: @user.posts, include: [:comments]
  end

  def gethelpers
    
    @user= User.find_by(id:params[:id])
    @posts = @user.offered_help_posts
    render json: @posts,  include: [:comments]
  end

  def profile
    render json: @user
  end
 
  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: @user, jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update 
    @user = User.find_by(id:params[:id])
    @user.update(user_params)
    render json: @user
  end
 
  private
 
  def user_params
    params.require(:user).permit(:username, :password, :image, :email, :city, :karma_score, :bio)
  end
end

# net vsex attr in user_params
