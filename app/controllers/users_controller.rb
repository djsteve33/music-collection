class UsersController < ApplicationController
   
  

   get '/signup' do
      erb :'users/signup'  
       
   end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/users/failure'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      #binding.pry 
      redirect to '/login'
    end
  end

  get '/users/failure' do
    erb :'users/failure'
  end

  get '/users/:id' do
    @user = User.find_by(params[:id])
    erb :'users/show'
 end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/albums'
    end
  end

  post '/login' do
  @user = User.find_by(:username => params[:username])
 
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
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