class Registry < ApplicationRecord

  enum status: {
    open: 0,
    closed: 1
  }

  validates :name, :status, presence: true

  has_many :registry_coordinators
  has_many :coordinators, through: :registry_coordinators

end
