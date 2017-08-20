class Categories::RegularTask < Category

  # Associations ===============================================================
  has_many :regular_tasks

  # Scopes  ===============================================================
  scope :enabled, -> { where(enable: true) }
end
