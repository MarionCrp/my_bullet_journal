class Category < ApplicationRecord

  # Callbacks ==================================================================
  validates :title, presence: true

end
