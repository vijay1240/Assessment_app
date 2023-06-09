class EnrollmentParticipant < ApplicationRecord
  belongs_to :enrollment_information
  belongs_to :participant
end
