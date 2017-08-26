class Tasks::RegularTask < Task

  # Associations ===============================================================
  belongs_to :category, class_name: "Categories::RegularTask"
  has_one :user, through: :category

  validates :category, presence: true

  # Scopes =====================================================================
  scope :done, -> {
    where(done: true)
  }
  scope :by_month, -> (month_with_year) {
    beginning_of_month = month_with_year.beginning_of_month
    end_of_month = month_with_year.end_of_month
    where("date >= ? and date <= ?", beginning_of_month, end_of_month)
  }
end
