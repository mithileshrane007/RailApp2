class ApiController < ApplicationController

	def add_user
    	name = params[:name]
		user_type = params[:user_type]	
		phone=params[:phone]
		email=params[:email]
		password_digest=params[:password]
		
		created_at= DateTime.now
		puts created_at

		data1={}
		
		if not User.check_for_duplicates_for_phone_email(phone,email) 
			if name.present? && user_type.present?  && phone.present? && email.present? && password_digest.present?

				user=User.create(name: name,user_type: user_type,created_at: created_at,phone: phone,image: nil,description: nil,email: email,password_digest: password_digest)
				o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten

				track_id_reg=user.id.to_s+"_"+(0..3).map { o[rand(o.length)] }.join.to_s
				if user_type == 'creator'
					user.track_id_reg=track_id_reg
				end
				user.password_digest = BCrypt::Password.create(params[:password])
				if not params[:image].blank?
					StringIO.open(Base64.decode64(params[:image])) do |data|
				      data.class.class_eval { attr_accessor :original_filename, :content_type }
				      data.original_filename = "file.jpg"
				      data.content_type = "image/jpeg"

				      puts "=========================="
				      puts data.inspect
				      puts "=========================="

				      user.image = data
				    end
				end
				user.save
				puts "ghhhh"
				puts "ghhhh"+user.errors.inspect

				flash[:notice] = user.errors.full_messages.to_sentence
				puts "sfdfdf"+user.errors.full_messages.to_sentence
				if user.errors.full_messages.to_sentence =="" 
					data1['error'] = '0'
					data1['msg'] = 'Entry suceessful'
					puts track_id_reg
					data1['code']=track_id_reg
					data1['message_cause']=user.errors.full_messages.to_sentence

				else

					data1['error'] = '1002'
					data1['msg'] = 'Entry unsuceessful.'
					data1['message_cause']=user.errors.full_messages.to_sentence
					
		    	end
			else
					data1['error'] = '1002'
					data1['msg'] = 'Entry unsuceessful.Invalid Params.'

			end
		else
			data1['error'] = '1003'
			data1['phone_email']=User.check_for_duplicates_for_phone_email(phone,email)
			data1['msg'] = 'Entry unsuceessful.Duplicate Entry or Something went wrong.'
			data1['phone']= User.exists?(phone:	phone)
  	 		data1['email']= User.exists?(email: email)
		end
    	respond_to do |format|
	      			format.json { render json: data1 }
	    			end
    end




    def add_target
	 	name = params[:name]
		user_type = params[:user_type]	
		phone=params[:phone]
		email=params[:email]
		password_digest=params[:password]
		address=params[:address]
		dateofbirth=params[:dateofbirth]
		description=params[:description]
		image=params[:image]
		job_time_interval=params[:job_time_interval]
		job_time_out=params[:job_time_out]
		target_user_id=params[:track_id_reg]
		creator_user_id=params[:login_id]
		created_at= DateTime.now

		puts created_at

		data={}
		if not User.check_for_duplicates_for_phone_email(phone,email) 
			if address.present? && password_digest.present? && user_type.present? && name.present? && phone.present? && email.present? && dateofbirth.present? && description.present? && image.present? && job_time_interval.present?  && job_time_out.present? && target_user_id.present? && creator_user_id.present? 

				user=User.create(name: name,user_type: user_type,created_at: created_at,phone: phone,description: description,email: email,password_digest: password_digest)
	 
				user.password_digest = BCrypt::Password.create(params[:password])


				if not params[:image].blank?

						StringIO.open(Base64.decode64(params[:image])) do |data|
					      data.class.class_eval { attr_accessor :original_filename, :content_type }
					      data.original_filename = "file.jpg"
					      data.content_type = "image/jpeg"

					      puts "=========================="
					      puts data.inspect
					      puts "=========================="

					      user.image = data
					    end
					end
				user.save
				puts user.errors.inspect
				if user.errors.full_messages.to_sentence =="" #logs.blank?
					data['error'] = '0'
					data['msg'] = 'Entry sucessful'

	#				puts "created object::"+company.company_uid
				else

					data['error'] = '1002'
					data['msg'] = 'Entry unsucessful'
					
		    	end
		    else
		    	data['error'] = '1002'
				data['msg'] = 'Entry unsucessful.Partial data'	
			end	
		else
				data['error'] = '1003'
				data['msg'] = 'Entry unsucessful.Something went wrong.'
				data['phone']= User.exists?(phone:	phone)
  	 			data['email']= User.exists?(email: email)
		end

		respond_to do |format|
	      			format.json { render json: data }
	    			end

    end


    def generate_track_id
		o = [('a'..'z'), ('A'..'Z'),('0' .. '9')].map { |i| i.to_a }.flatten
		data ={}
		data['pin']=(0..5).map { o[rand(o.length)] }.join.to_s
    	
		respond_to do |format|
	      			format.json { render json: data }
	    			end
    end


    def login
    	login_id = params[:login_id]
    	password= params[:password]

		
		data={}
    	if login_id.present? && password.present? 
    		company = User.find_by_track_id_reg(params[:login_id])
    		if company && company.authenticate(params[:password])
    			data['error'] = '0'
				data['msg'] = 'suceessful login.'	

    		else
				data['error'] = '1002'
				data['msg'] = 'unsuceessful.Something went wrong.'	
    		end

    	else
			data['error'] = '1003'
			data['msg'] = 'Something went wrong.Invalid Data'	
    	end
    	respond_to do |format|
	      			format.json { render json: data }
	    			end	 
    	
    end


def get_user_list
    	login_id = params[:login_id]
	

		data={}
		if company_uid.present?
			

			company=User.where(company_id: company_uid)

			puts "Insput value::::::::::::"+company.inspect
			for i in company
				puts i.id ,i.user_type
			end
			if not company.blank? #logs.blank?
				data['error'] = '0'
				data['msg'] = 'Sucessful'
				data['user_list']=company
			#	data['image_url']=company.image

			else

				data['error'] = '0'
				data['msg'] = 'Sucessful'
				data['user_list']=company
		#		data['image_url']=company.image

				
	    	end
		else
				data['error'] = '1002'
				data['msg'] = 'Unsucessful.No company exists.'
		end

		respond_to do |format|
	      			format.json { render json: data }
	    			end	
    end





end
