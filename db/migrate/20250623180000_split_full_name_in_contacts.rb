class SplitFullNameInContacts < ActiveRecord::Migration[8.0]
  def up
    add_column :contacts, :first_name, :string
    add_column :contacts, :last_name, :string

    # Optional: Split full_name into first_name and last_name
    Contact.reset_column_information
    Contact.find_each do |contact|
      if contact.full_name.present?
        names = contact.full_name.split(' ', 2)
        contact.update_columns(first_name: names[0], last_name: names[1])
      end
    end

    remove_column :contacts, :full_name
  end

  def down
    add_column :contacts, :full_name, :string
    Contact.reset_column_information
    Contact.find_each do |contact|
      contact.update_columns(full_name: [ contact.first_name, contact.last_name ].compact.join(' '))
    end
    remove_column :contacts, :first_name
    remove_column :contacts, :last_name
  end
end
