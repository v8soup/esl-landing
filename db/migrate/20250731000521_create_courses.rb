class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.integer :year
      t.string :title
      t.string :when
      t.integer :price
      t.string :active
      t.integer :jan
      t.integer :feb
      t.integer :mar
      t.integer :apr
      t.integer :may
      t.integer :jun
      t.integer :jul
      t.integer :aug
      t.integer :sep
      t.integer :oct
      t.integer :nov
      t.integer :dec
      t.timestamps
    end
    add_index :courses, :year
  end
end
