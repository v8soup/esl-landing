class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :full_name, null: false
      t.string :email, null: false
      t.string :phone
      t.string :first_language
      t.string :subject, null: false
      t.text :message, null: false
      t.text :notes

      t.timestamps
    end
  end
end
