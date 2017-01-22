class TagsEntry < ApplicationRecord
  belongs_to :tag
  belongs_to :entry

  validates_associated :tag
  validates_associated :entry

  validate :check_user
  
  def check_user
    if tag.user_id != entry.user_id
      errors.add(:tag_id, "can't be accepted")
    end
  end
end
