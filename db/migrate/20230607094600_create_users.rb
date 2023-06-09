class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :email
      t.string   :phone_number
      t.string   :gender
      t.date     :date_of_birth
      t.string   :type

      t.timestamps
    end
  end
end
