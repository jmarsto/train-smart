class CreateAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :assessments do |t|
      t.belongs_to :user
      t.boolean :pt, null: false
      t.boolean :crusher, null: false
      t.boolean :days, null: false
      t.boolean :enduro, null: false

      t.timestamps
    end
  end
end
