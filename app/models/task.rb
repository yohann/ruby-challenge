class Task < ApplicationRecord
  validates :title, :status, presence: true
  enum status: { created: 0, read: 1, executed: 2 }
end