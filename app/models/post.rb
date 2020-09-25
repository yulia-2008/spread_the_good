class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments
    belongs_to :helper, class_name: "User", foreign_key: :helper_id, optional: true
end
