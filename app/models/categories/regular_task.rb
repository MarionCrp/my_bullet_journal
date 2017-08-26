class Categories::RegularTask < Category

  # Associations ===============================================================
  has_many :regular_tasks, class_name: "Tasks::RegularTask", foreign_key: :category_id
  belongs_to :user

  validates :user, presence: true

  # Scopes  ===============================================================
  scope :enabled, -> { where(enable: true) }
end
