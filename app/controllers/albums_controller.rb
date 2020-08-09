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

    post '/albums' do
      @album = current_user.Album.create(params)
      redirect "/albums/#{@album.id}"  
    end

    get '/albums/:id' do
      if logged_in?
        @album. = Album.find(params[:id])
        erb :show
      else
        redirect to '/login'
      end
    end

    

end