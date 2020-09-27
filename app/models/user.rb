class User < ApplicationRecord
    has_secure_password
   
    has_many :posts
    has_many :comments, through: :posts
    has_many :comments
    has_many :posts, through: :comments
    
    has_many :offered_help_posts, class_name: "Post", foreign_key: :helper_id, dependent: :destroy
    has_many :help_seekers, through: :offered_help_posts, source: :help_seeker
    has_many :user_posts, class_name: "Post", foreign_key: :user_id, dependent: :destroy
    has_many :helpers, through: :user_posts, source: :helper

    validates :username, presence: true, uniqueness: {message: ' : User with the same username already exists!'} 
    validates :password_digest, presence: true 
    validates :email, presence: true 
    validates :city, presence: true 
end
