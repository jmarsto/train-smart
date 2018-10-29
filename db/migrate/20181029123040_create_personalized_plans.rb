class CreatePersonalizedPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :personalized_plans do |t|
      t.belongs_to :assessment, null: false
      t.belongs_to :plan, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
