class Tag < Resource
  belongs_to :user
  has_many :tags_entries
  has_many :entries, through: :tags_entries

  validates_associated :user
  validates :name, presence: true
  # TODO: nameの許可文字のバリデーション作る
  # '":/$%@&*~`\ 一部記号を利用不可にする
end
