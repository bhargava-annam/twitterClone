class AddUsernameToUsers < ActiveRecord::Migration[6.1]
  def change # any changes inside this method ,is translated to SQL code and modified the database(Currently,SqlLite)
    add_column :users, :username, :string # add a new column to table "users",called "username" and of type "string"
    add_index :users, :username, unique: true # index usernames for quick lookup and it is always unique
  end
end
