class User < ActiveRecord::Base
	has_many :link_table, foreign_key: "creator_user_id" 
	has_many :link_table, foreign_key: "target_user_id"
    validates :phone, length: { is: 10 }
	has_secure_password
	has_attached_file :image
	do_not_validate_attachment_file_type :image

	

	def self.check_for_duplicates_for_phone_email(phone,email)
		userphone=User.exists?(	phone: 	phone)
  	 	useremail=User.exists?(	email: email)
  	 	puts userphone
  	 	puts useremail
  	 	return userphone || useremail
		
	end
end
