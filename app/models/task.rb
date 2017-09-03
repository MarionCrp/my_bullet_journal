class Task < ApplicationRecord
  validates :date, presence: true

  scope :done, -> {
    where(done: true)
  }
end
