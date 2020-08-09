class AlbumsController < ApplicationController
    
    get '/albums' do
        if logged_in?
            @albums=Album.all 
            erb :'albums/albums'
        else
            redirect to '/login'
        end
    end

   get '/albums/new' do
      if logged_in?
        erb :'albums/new'
      else
        redirect to '/login'
      end
    end

    

    # create action
    #post '/music_collection' do
     #   music_collection = current_user.music_collection.build(params)
    #end

end