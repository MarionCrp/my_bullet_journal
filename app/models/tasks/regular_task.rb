class Tasks::RegularTask < Task

  # Associations ===============================================================
  belongs_to :category, class_name: "Categories::RegularTask"
  belongs_to :user

  validates :category, presence: true

  # Scopes =====================================================================

  scope :by_month, -> (month_with_year) {
    beginning_of_month = month_with_year.beginning_of_month
    end_of_month = month_with_year.end_of_month
    where("date >= ? and date <= ?", beginning_of_month, end_of_month)
  }
end
