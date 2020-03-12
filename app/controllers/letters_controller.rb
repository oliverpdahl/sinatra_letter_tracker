class LettersController < ApplicationController

  # GET: /letters
  get "/letters" do
    if logged_in?
      #show letters
      @all = current_user.letters
      erb :"/letters/index"
    else
      #ask to login
      flash[:message] = "Must be loged in to view letters"
      redirect '/login'
    end
  end

  # GET: /letters/new
  get "/letters/new" do
    if logged_in?
      @user = current_user
      erb :"/letters/new"
    else
      redirect '/login'
    end
  end

  # POST: /letters
  post "/letters" do
    if recipient_filled?
      @letter = Letter.create(params[:letter]) #update
      if new_recipient?
        @letter.recipient = Recipient.create(params[:recipient][:name], address: params[:recipient][:address])
        current_user.recipients << @letter.recipient
        @letter.save
        current_user.save
      end
      current_user.letters << @letter
      redirect "/letters/#{@letter.id}"
    else
      flash[:message] = "Make sure your letter has a recipient"
      redirect '/letters/new'
    end
  end

  # GET: /letters/5
  get "/letters/:id" do
    if logged_in?
      @letter = Letter.find(params[:id])
      erb :"/letters/show"
    else
      redirect '/login'
    end
  end

  # GET: /letters/5/edit
  get "/letters/:id/edit" do
    @letter = Letter.find(params[:id])
    @user = @letter.user
    if logged_in? && current_user == @letter.user
      erb :"/letters/edit"
    elsif logged_in?
      flash[:message] = "You can only edit you own letters"
       redirect '/letters'
    else
      redirect '/login'
    end
  end

  # PATCH: /letters/5
  post "/letters/:id/edit" do
    if !!(@letter = Letter.find(params[:id])) && params[:content].empty? #UPDATE
      if recipient_filled?
        @letter = Letter.update(params[:letter]) #update
        if new_recipient?
          @letter.recipient = Recipient.create(params[:recipient][:name], address: params[:recipient][:address])
          current_user.recipients << @letter.recipient
          @letter.save
          current_user.save
        end
        current_user.letters << @letter
        redirect "/letters/#{@letter.id}"
      else
        flash[:message] = "Make sure your letter has a recipient"
        redirect "letters/#{@letter.id}/edit"
      end
    else
      flash[:message] = "Could not find your letter"
      redirect "/letters"
    end
  end

  # DELETE: /letters/5/delete
  post '/letters/:id/delete' do
    if logged_in?
      @letter = Letter.find_by_id(params[:id])
      if @letter && @letter.user == current_user
        @letter.delete
      end
      flash[:message] = "Letter successfuly deleted"
      redirect to "/users/#{current_user.slug}"
    else
      flash[:message] = "Must be logged in to delete letters"
      redirect to '/login'
    end
  end
  # delete "/letters/:id" do
  #   @letter = Letter.find(params[:id])
  #   if @letter && logged_in? && current_user == @letter.user
  #     @letter.delete
  #     redirect '/letters'
  #   else
  #     flash[:message] = "Can't delete other users letters"
  #     redirect "/letters"
  #   end
  # end

  helpers do
    def recipient_filled?
       exisiting_recipient? || new_recipient?
    end
    def exisiting_recipient?
      !params[:letter][:recipient_id].empty?
    end
    def new_recipient?
      !params[:recipient][:name].empty? && !params[:recipient][:address].empty?
    end
  end
end
