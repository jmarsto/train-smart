class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.belongs_to :user
      t.belongs_to :assessment

      t.timestamps
    end
  end
end
