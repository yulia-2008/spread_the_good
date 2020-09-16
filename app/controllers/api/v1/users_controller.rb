class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create,  :index, :show, :update]
 
  def index
    @users = User.all 
    render json: @users
  end

  def show 
    @user = User.find_by(id:params[:id])
    render json: @user, include: [:posts, :comments], status: :accepted
  end

  def profile
    render json: @user
  end
 
  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update 
    @user = User.find_by(id:params[:id])
    @user.update(user_params)
    render json: { user: UserSerializer.new(@user), jwt: @token }, status: :accepted
  end
 
  private
 
  def user_params
    params.require(:user).permit(:username, :password, :image, :email, :city)
  end
end

# net vsex attr in user_params
