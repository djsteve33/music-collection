mary@mail.com = User.create(email: "mary@mail.com")
Album.create(media_type: "Vinyl", genre: "Rock", artist_name: "Journey", 
album_name: "Departure", user: mary@mail.com)