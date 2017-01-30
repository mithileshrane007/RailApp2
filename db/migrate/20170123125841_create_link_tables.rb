class CreateLinkTables < ActiveRecord::Migration
  def change
    create_table :link_tables do |t|
    	t.column :creator_user_id, :string,:null => false
		t.column :target_user_id, :string ,:null => false
		t.column :target_permission_grant ,:boolean,:default => false
		t.column :created_at, :timestamp,:null => false
		t.column :tracker_id, :string,:null => true
		t.column :job_time_interval, :string,:null => true
		t.column :job_time_out, :string,:null => true
    end
  end
end
