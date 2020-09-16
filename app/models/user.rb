class User < ApplicationRecord
    has_secure_password
   
    has_many :posts
    has_many :comments, through: :posts
    has_many :comments
    has_many :posts, through: :comments
    
    has_many :active_relationships, class_name: "Connection", foreign_key: :helper_id, dependent: :destroy
    has_many :help_seekers, through: :active_relationships, source: :help_seeker
    has_many :passive_relationships, class_name: "Connection", foreign_key: :help_seeker_id, dependent: :destroy
    has_many :helpers, through: :passive_relationships, source: :helper

    validates :username, presence: true, uniqueness: {message: ' : User with the same username already exists!'} 
    validates :password_digest, presence: true 
    validates :email, presence: true 
    validates :city, presence: true 
end
