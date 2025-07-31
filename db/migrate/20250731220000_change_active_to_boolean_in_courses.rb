class ChangeActiveToBooleanInCourses < ActiveRecord::Migration[8.0]
  def up
    # Convert string values to boolean
    change_column :courses, :active, :boolean, default: false
  end

  def down
    change_column :courses, :active, :string
  end
end
