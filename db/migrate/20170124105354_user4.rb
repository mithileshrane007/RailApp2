class User4 < ActiveRecord::Migration
  def change

  	remove_column :users, :phone
  	add_column :users , :phone, :integer

  end
end
