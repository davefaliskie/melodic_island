class ProfilePicture < ActiveRecord::Base
	belongs_to :user

	has_attached_file :asset, 
	:styles =>{
		:round => '500x500>',
		:medium => '300x300>',
		:large_thumb => '140x140>',
		:thumb => '50x50#' 
	},
		:path => "profile_pictures/:id/:style.:extension", 
        :storage => :s3, 
        :bucket => "melodicisland",
        :s3_credentials => {
        	:access_key_id => ENV['AWS_ACCESS_KEY_ID'],
		    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
        	}
	
	
	validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
end


