class WelcomeController < ApplicationController
  
  def index
    
  end
  def indexCheck
    # check input, other processing here
    redirect_to welcome_volunteer_path # go to next if everything is good
  end
  def volunteer
    
  end
  def volunteerCheck
    redirect_to welcome_volunteer_path # stay at current page if error checking fails
  end
end
