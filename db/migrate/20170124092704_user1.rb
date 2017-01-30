class User1 < ActiveRecord::Migration
  def change
  	add_column :users , :phone, :integer, :length =>9
  end
end
