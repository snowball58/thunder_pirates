class WelcomeController < ApplicationController
  def index
    
  end
  def indexCheck
    # check input, other processing here
    redirect_to welcome_volunteer_path
  end
  def volunteer
    puts "This is the volunteer controller."
  end
end
