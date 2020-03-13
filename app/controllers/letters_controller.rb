class LettersController < ApplicationController

  get "/letters" do
    if logged_in?
      @all = current_user.letters
      erb :"/letters/index"
    else
      flash[:message] = "Must be loged in to view letters"
      redirect '/login'
    end
  end

  get "/letters/new" do
    if logged_in?
      @user = current_user
      erb :"/letters/new"
    else
      redirect '/login'
    end
  end

  post "/letters" do
    if recipient_filled?
      @letter = Letter.create(params[:letter]) #update
      if new_recipient?
        @letter.recipient = Recipient.create(name: params[:recipient][:name], address: params[:recipient][:address])
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

  get "/letters/:id" do
    if logged_in?
      @letter = Letter.find(params[:id])
      erb :"/letters/show"
    else
      redirect '/login'
    end
  end

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

  post "/letters/:id/edit" do
    if !!(@letter = Letter.find(params[:id]))
      if recipient_filled?
        @letter.update(params[:letter])
        if new_recipient?
          @letter.recipient = Recipient.create(name: params[:recipient][:name], address: params[:recipient][:address])
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

  helpers do
    def recipient_filled?
       exisiting_recipient? || new_recipient?
    end
    def exisiting_recipient?
      !!(recipient_id = params[:letter][:recipient_id]) ? !recipient_id.empty? : false
    end
    def new_recipient?
      !params[:recipient][:name].empty? && !params[:recipient][:address].empty?
    end
  end
end
