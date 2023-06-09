class Coordinator < User

  has_many :enrollment_informations, dependent: :destroy
  has_many :registries, through: :enrollment_informations
  has_many :participants, through: :enrollment_informations


  accepts_nested_attributes_for :enrollment_informations

  def self.to_csv
    attributes = %w{id email name phone_number gender date_of_birth participants}

    CSV.generate(headers: true) do |csv|
      csv << ['Id', 'Email', 'Name', 'Participants Name']

      all.includes(:participants).each do |coordinator|
        csv << [coordinator.id, coordinator.name, coordinator.email, coordinator.participants.pluck(:name).join(', ')]
      end
    end
  end
  
end
