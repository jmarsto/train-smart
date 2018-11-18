class AddColumnsToAssessments < ActiveRecord::Migration[5.2]
  def change
    add_column :assessments, :trainable, :boolean, null: false
    add_column :assessments, :static, :boolean, null: false
    add_column :assessments, :mental, :boolean, null: false
    add_column :assessments, :flexible, :boolean, null: false
    add_column :assessments, :tendonitis, :boolean, null: false
  end
end
