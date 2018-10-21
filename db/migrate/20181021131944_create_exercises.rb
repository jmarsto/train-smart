class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.belongs_to :session, optional: true
      t.string :name, null: false
      t.text :description
      
      t.timestamps
    end
  end
end
