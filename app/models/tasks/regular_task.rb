class Tasks::RegularTask < Task

  # Associations ===============================================================
  belongs_to :category, class_name: "Categories::RegularTask"

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
