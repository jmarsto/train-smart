class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.belongs_to :user, optional: true
      t.belongs_to :assessment, optional: true
      t.string :name

      t.timestamps
    end
  end
end
