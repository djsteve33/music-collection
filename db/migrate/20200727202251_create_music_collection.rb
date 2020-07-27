class CreateMusicCollection < ActiveRecord::Migration
  def change
    create_table :music_collection do |t|
      t.string :media_type
      t.string :genre
      t.string :artist_name
      t.string :album_name
  end
end
