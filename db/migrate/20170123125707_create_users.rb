class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

		t.column :name, :string,:null => false
		t.column :email, :string ,:null => false
		t.column :user_type, "enum('creator','target')", :default => 'target'
		t.column :image ,:string,:null => false
		t.column :created_at, :timestamp,:null => false
		t.column :verified_email, :boolean,:default => false
		t.column :verified_phone, :boolean,:default => false
		t.column :description, :string,:null => true
		t.column :online, "enum('offline','online')", :default => 'offline'


    end
  end
end
