class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :userID
      t.string :email
      t.string :password
      t.string :fname
      t.string :lname
      t.boolean :isOwner

      t.timestamps
    end
  end
end
