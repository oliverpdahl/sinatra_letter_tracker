class LettersController < ApplicationController

  # GET: /letters
  get "/letters" do
    if logged_in?
      #show tweets
      @all = current_user.letters
      erb :"/letters/index.html"
    else
      #ask to login
      flash[:message] = "Must be loged in to view letters"
      redirect '/login'
    end
  end

  # GET: /letters/new
  get "/letters/new" do
    if logged_in?
      erb :"/letters/new.html"
    else
      redirect '/login'
    end
  end

  # POST: /letters
  post "/letters" do
    if params[:content].empty? #UPDATE
      flash[:message] = "Make sure fields are filled"
      redirect '/letters/new'
    else
      @letter = letter.create() #update
      #Add for create recipient
      current_user.letters << @letter
      redirect "/letters/#{@letter.id}"
    end
  end

  # GET: /letters/5
  get "/letters/:id" do
    if logged_in?
      @letter = Letter.find(params[:id])
      erb :"/letters/show.html"
    else
      redirect '/login'
    end
  end

  # GET: /letters/5/edit
  get "/letters/:id/edit" do
    @letter = Letter.find(params[:id])
    if logged_in? && current_user == letter.user
      erb :"/letters/edit.html"
    elsif logged_in?
      flash[:message] = "You can only edit you own tweets"
       redirect '/letters'
    else
      redirect '/login'
    end
  end

  # PATCH: /letters/5
  patch "/letters/:id" do
    @letter = Letter.find(params[:id])
    if params[:content].empty? #UPDATE
      #ADD ALTERNATIVE recipient
      flash[:message] = "Cannot have empty letter"
      redirect "/letters/#{@letter.id}/edit"
    elsif logged_in?
      @letter.content = params[:content]
      @letter.save
      redirect "/letters/#{@letter.id}"
    else
      flash[:message] = 'Must be logged in to edit letter'
      redirect '/login'
    end
  end

  # DELETE: /letters/5/delete
  delete "/letters/:id/delete" do
    @letter = Letter.find(params[:id])
    if logged_in? && current_user == @letter.user
      @letter.delete
      redirect '/letters'
    else
      flash[:message] = "Can't delete other users letters"
      redirect "/letters/#{@letter.id}"
    end
  end
end
