class CreatePhases < ActiveRecord::Migration[5.2]
  def change
    create_table :phases do |t|
      t.belongs_to :plan
      t.string :name
    end
  end
end
