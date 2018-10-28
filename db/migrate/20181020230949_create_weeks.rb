class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.belongs_to :phase
      t.belongs_to :plan
      t.integer :number, null: false
    end
  end
end
