class Log < ActiveRecord::Base

	has_one :user through :link_table

end
