class Connection < ApplicationRecord
    belongs_to :help_seeker, class_name: "User", foreign_key:  :help_seeker_id
    belongs_to :helper, class_name: "User", foreign_key: :helper_id
end
