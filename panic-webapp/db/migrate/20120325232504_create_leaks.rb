class CreateLeaks < ActiveRecord::Migration
  def change
    create_table :leaks do |t|
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
