class UsersController < ApplicationController
    # index action
    #get '/users' do
     #   @users = User.all 
      #  erb :index
  #  end

    # show action
  #  get 'users/:id' do
       # @user = User.find_by_id(params[:id])
      #  erb :'/show'
   # end

   get '/signup' do
      erb :'users/create_user'    
  end

  post '/signup' do
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      if  @user.save
      session[:user_id] = @user.id
      redirect to '/login'
      else
        redirect to '/failure'
      end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/albums'
    end
  end

  post '/login' do
  user = User.find_by(:username => params[:usernamer])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
     redirect to '/albums'
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end