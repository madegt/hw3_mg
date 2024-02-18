class PlacesController < ApplicationController

  # list all places I have been = render index view
  def index
    @places = Place.all
    end
  
    
  # see place profile and posts = render place view
  
  def show
    @place = Place.find_by({"id" => params["id"]})
    @entries = Entry.where({"place_id" => @place["id"]})
  end
  
  # render view with new place form
  def new
  end
  
  #create new place
  def create
    # start with a new Place
    @place = Place.new
    # assign user-entered form data to Place's columns
    @place["name"] = params["name"]
    # save row
    @place.save
    # redirect user
    redirect_to "/places"
  end
 


end
