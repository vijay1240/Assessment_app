class CreateEnrollmentInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollment_informations do |t|
      t.datetime :date_of_enrollment
      t.string   :method_of_contact
      t.text     :remarks
      t.integer  :coordinator_id
      t.integer  :registry_id

      t.timestamps
    end
  end
end
