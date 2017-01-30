class User3 < ActiveRecord::Migration
  def change
  	add_column :users , :track_id_reg, :string

  end
end
