class Participant < User
  has_many :enrollment_participants
  has_many :enrollment_informations, through: :enrollment_participants
  has_many :registries, through: :enrollment_informations
end
