class RecipientsController < ApplicationController

  # GET: /recipients
  get "/recipients" do
    erb :"/recipients/index.html"
  end

  # GET: /recipients/new
  get "/recipients/new" do
    erb :"/recipients/new.html"
  end

  # POST: /recipients
  post "/recipients" do
    redirect "/recipients"
  end

  # GET: /recipients/5
  get "/recipients/:id" do
    erb :"/recipients/show.html"
  end

  # GET: /recipients/5/edit
  get "/recipients/:id/edit" do
    erb :"/recipients/edit.html"
  end

  # PATCH: /recipients/5
  patch "/recipients/:id" do
    redirect "/recipients/:id"
  end

  # DELETE: /recipients/5/delete
  delete "/recipients/:id/delete" do
    redirect "/recipients"
  end
end
