class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :week_number
      t.date :starting
      t.date :ending

      t.timestamps
    end
  end
end
