class Audio < ActiveRecord::Base
	belongs_to :artist

	has_attached_file :song,
		:path => "audios/:id/.:extension", 
        :storage => :s3, 
        :bucket => "melodicisland",
        :s3_credentials => {
        	:access_key_id => ENV['AWS_ACCESS_KEY_ID'],
		    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
        	}

	validates_attachment_content_type :song, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]

end
