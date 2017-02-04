class Entry < Resource
  belongs_to :user
  has_one :memo, foreign_key: :id, dependent: :destroy, inverse_of: :entry
  has_many :tags_entries, inverse_of: :entry
  has_many :tags, through: :tags_entries
  accepts_nested_attributes_for :memo, update_only: true
  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :tags_entries, allow_destroy: true

  validates_associated :user

  
end
