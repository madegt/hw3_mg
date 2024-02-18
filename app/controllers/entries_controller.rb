class EntriesController < ApplicationController
  
# render contacts/show view with details about Contact
def show
  @entry = Entry.find_by({"id" => params["id"]})
  @place = Place.find_by({"id" => @entry["place_id"]})
end

def new
  @entry = Entry.new
  # render contacts/new view with new Contact form
end

#create new post acording to entries table
def create
  @entry = Entry.new

  # assign user-entered form data to Entries's columns
  @entry["title"] = params["title"]
  @entry["description"] = params["description"]
  @entry["posted_on"] = params["posted_on"]

  # assign relationship between Contact and Company
  @entry["place_id"] = params["place_id"]

  # save row
  @entry.save

  # redirect user
  redirect_to "/places/#{@entry["place_id"]}"
end



end
