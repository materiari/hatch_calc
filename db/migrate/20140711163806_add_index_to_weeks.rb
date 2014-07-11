class AddIndexToWeeks < ActiveRecord::Migration
  def change
    add_index :weeks, [:starting,:ending]
  end
end
