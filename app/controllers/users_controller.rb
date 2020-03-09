class UsersController < ApplicationController

  # GET: /users/new
  get "/signup" do
    if logged_in?
      flash[:message] = "Already logged in"
      redirect '/letters'
    else
      erb :"/users/new.html"
    end
  end

  # POST: /users
  post "/signup" do
    if fields_filled?
      login(User.create(username: params[:username], password: params[:password])) #creates and logs in user
      redirect '/letters'
    else
      flash[:message] = "Make sure that all the fields are filled"
      redirect '/signup'
    end
  end

  # GET: /users/new
  get "/login" do
    if logged_in?
      redirect '/tweets'
    else
      erb :"/users/login.html"
    end
  end

  # POST: /users
  post "/login" do
    if fields_filled?
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        login(user)
        redirect '/letters'
      else
        redirect '/login'
      end
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  # GET: /users/5
  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    erb :"/users/show.html"
  end

  # # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end
  #
  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end
  #
  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end
