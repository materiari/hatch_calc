class AddIndexToWorkout < ActiveRecord::Migration
  def change
    add_index :workouts, [:week, :day]
  end
end
