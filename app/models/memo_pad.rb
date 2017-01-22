class MemoPad < Resource
  belongs_to :user

  validates_associated :user
  validates :title, presence: true
end
