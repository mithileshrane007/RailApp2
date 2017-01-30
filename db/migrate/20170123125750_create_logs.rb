class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|

		t.column :latitude, :double,:null => true
		t.column :longitude, :double ,:null => true
		t.column :timezone_str, :string,:null => true
		t.column :timezone_id ,:string,:null => true
		t.column :created_at, :timestamp,:null => true
		t.column :tracker_id, :string,:null => true
		t.column :status_of_valid, :string,:null => true

    end
  end
end
