class Tag < Resource
  belongs_to :user
  has_many :tags_entries
  has_many :entries, through: :tags_entries

  validates_associated :user
  validates :name, presence: true
end
