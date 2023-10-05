class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      # timestamps method adds two columns to the table: created_at and updated_at
      t.timestamps
    end
  end
end
