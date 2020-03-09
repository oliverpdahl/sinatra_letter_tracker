class UsersController < ApplicationController

  # GET: /users/new
  get "/signup" do
    if logged_in?
      flash[:message] = "Already logged in"
      redirect "/users/#{user.slug}"
    else
      erb :"/users/new.html"
    end
  end

  # POST: /users
  post "/signup" do
    if fields_filled?
      if !!(User.find_by(username: params[:username]))
        flash[:message] = "Username already taken"
        redirect '/signup'
      else
        login(User.create(username: params[:username], password: params[:password])) #creates and logs in user
        redirect "/users/#{current.slug}"
      end
    else
      flash[:message] = "Make sure that all the fields are filled"
      redirect '/signup'
    end
  end

  # GET: /users/new
  get "/login" do
    if logged_in?
      flash[:message] = "Already logged in"
      redirect "/users/#{current_user.slug}"
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
        redirect "/users/#{user.slug}"
      else
        flash[:message] = "Username password combination incorrect"
        redirect '/login'
      end
    else
      flash[:message] = "Make sure that all fields are filled in"
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    flash[:message] = "Logged out"
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
