class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.belongs_to :day
      t.belongs_to :exercise
      
      t.timestamps
    end
  end
end
