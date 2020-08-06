class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :media_type
      t.string :artist_name
      t.string :album_name
      t.integer :user_id
  end
end
