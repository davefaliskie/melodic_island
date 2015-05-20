class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.integer :artist_id
      t.timestamps
    end
    	add_attachment :audios, :song
    	add_index :audios, :artist_id
  end
end
