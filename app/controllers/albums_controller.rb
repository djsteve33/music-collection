class AlbumsController < ApplicationController
    
    get '/albums' do
        if logged_in?
            @album = Album.all 
            erb :'albums/albums'
        else
            redirect to '/login'
        end
    end

   get '/albums/new' do
      if logged_in?
        erb :'/albums/new'
      else
        redirect to '/login'
      end
    end

    post '/albums' do
      @album = current_user.albums.create(params)
      redirect "/albums/#{@album.id}"  
    end

    get '/albums/:id' do
      if logged_in?
        @album = Album.find(params[:id])
        erb :'/albums/show_album'
      else
        redirect to '/login'
      end
    end

    get '/albums/:id/edit' do
      if logged_in?
        @album = Album.find(params[:id])
        if @album.user_id == current_user.id
          erb :'albums/edit'
        else
          redirect to '/albums'
        end
      else
        redirect to '/login'
      end
    end
 
    patch '/albums/:id' do
      #binding.pry
      if logged_in?
        if params[:album_name] == ""
          redirect to "/albums/#{params[:id]}/edit"
        else
          @album = Album.find_by_id(params[:id])
          params.delete(:_method)
          if @album && @album.user == current_user
            if @album.update(params)
              redirect to "/albums/#{@album.id}"
            else
              redirect to "/albums/#{@album.id}/edit"
            end
            redirect to "/albums"
          end
        end
      else
        redirect to '/login'
      end
    end

    delete '/albums/:id' do
      if logged_in?
        @album = Album.find_by(params[:id])
        if @album && @album.user == current_user
          @album.destroy
        end
        redirect to '/albums'
      else
        redirect to '/login'
      end
    end
end