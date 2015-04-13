class CreateProfilePictures < ActiveRecord::Migration
  def change
    create_table :profile_pictures do |t|

		t.integer :user_id
		t.timestamps
    end
    	add_attachment :profile_pictures, :asset
    	add_index :profile_pictures, :user_id
  end
end
