class LinkTable < ActiveRecord::Base
	belongs_to :log
	belongs_to :users
end
