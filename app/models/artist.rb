class Artist < ActiveRecord::Base
	belongs_to :user
	has_many :audios

# ************* cover photo *****************
	has_attached_file :cover_photo, styles:{
		medium: '300x300>'
	}

	validates_attachment_content_type :cover_photo, :content_type => /\Aimage\/.*\Z/

	validates :name, presence: true, length:(2..50), uniqueness: true
	validates :artist_type, presence: true
	validates :genre, presence: true, length:(2..50)
	validates :bio, presence: true




end
