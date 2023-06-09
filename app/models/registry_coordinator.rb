class RegistryCoordinator < ApplicationRecord
  include RescueUniqueConstraint
  rescue_unique_constraint index: "index_registry_coordinators_on_registry_id_and_user_id", field: :register_id

  belongs_to :registry
  belongs_to :coordinator, foreign_key: :user_id

end
