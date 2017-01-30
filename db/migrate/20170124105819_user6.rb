class User6 < ActiveRecord::Migration
  def change
  	remove_column :users, :online
  	add_column :users , :isOnline, :boolean,:default => false
  end
end
