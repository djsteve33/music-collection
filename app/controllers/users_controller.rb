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
    if logged_in?
      erb :'users/create_user'
      #locals: (message: "Please sign up before you sign in")
    else
      redirect to '/albums'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/albums'
    end
  end
end