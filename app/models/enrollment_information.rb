class EnrollmentInformation < ApplicationRecord
  CONTACT_METHODS = [:email, :phone]

  validates :registry_id, presence: true

  belongs_to :registry
  has_many :enrollment_participants, dependent: :destroy
  has_many :participants, through: :enrollment_participants

  before_validation :set_enrollment_date

  private

  def set_enrollment_date
    self.date_of_enrollment ||= Date.today
  end

end
