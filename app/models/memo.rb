class Memo < Resource
  belongs_to :entry, foreign_key: :id
  
  # validates_associated :entry
  validates :content, presence: true
  # validate :check_user
  
  # def check_user
  #   unless self.user_id == memo_pad.try(:user_id)
  #     errors.add(:user_id, "can't be accepted")
  #   end
  # end

  scope :user, -> (user_id) { 
    joins(:entry).where("entries.user_id" => user_id)
  }
end
