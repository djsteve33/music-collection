mary@mail.com = User.create(email: "mary@mail.com")
departure = Album.new(media_type: "Vinyl", artist_name: "Journey", 
album_name: "Departure")
departure.user = mary@mail.com
departure.save