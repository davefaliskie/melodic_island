class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
    	t.string :name
    	t.string :artist_type
    	t.string :genre
    	t.text :bio
    	t.integer :user_id
    	t.timestamps
    end
    add_attachment :artists, :cover_photo
    add_index :artists, :user_id
  end
end
