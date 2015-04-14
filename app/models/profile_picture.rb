class ProfilePicture < ActiveRecord::Base
	belongs_to :user

	has_attached_file :asset, styles:{
		large: '500x500>',
		medium: '300x300>',
		small: '140x140>',
		thumb: '50x50#',
		cropped: '' 
	}, :default_url => "/images/missing.png"
	# default icon from http://imgarcade.com/1/default-user-icon/
	
	validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
	crop_attached_file :asset
end


