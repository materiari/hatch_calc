class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :week
      t.integer :day
      t.string :lift
      t.integer :set_number
#Actual data items, the rest is keys/sorting
      t.integer :reps
      t.float :percentage

      t.timestamps
    end
  end
end
