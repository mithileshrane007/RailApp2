class User5 < ActiveRecord::Migration
  def change

  	remove_column :users, :phone
  	add_column :users , :phone, :integer , :limit => 8
  end
end
