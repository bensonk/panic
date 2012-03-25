class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.string :username
      t.string :hash
      t.string :password
      t.string :email
      t.integer :leak_id

      t.timestamps
    end
  end
end
