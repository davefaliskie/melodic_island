class AddLocation < ActiveRecord::Migration
  def change
  	add_column :users, :zip_code, :integer
  	add_column :users, :latitude, :float
  	add_column :users, :longitude, :float

  	add_column :users, :terms_conditions, :boolean

  	add_index :users, :zip_code
  end
end

