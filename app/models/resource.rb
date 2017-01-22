class Resource < ApplicationRecord
  self.abstract_class = true

  scope :user, -> (user_id) { where(user_id: user_id)}
end
