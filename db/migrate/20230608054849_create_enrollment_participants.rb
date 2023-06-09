class CreateEnrollmentParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollment_participants do |t|
      t.integer  :enrollment_information_id
      t.integer  :participant_id

      t.timestamps
    end
  end
end
