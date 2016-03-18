class WelcomeController < ApplicationController
  
  def index
    
  end
  
  def index_check
    # check input, other processing here
    redirect_to welcome_volunteer_path # go to next if everything is good
  end
  
  def volunteer
    
  end
  
  def volunteer_check
    redirect_to welcome_general_info_path
  end
  
  def general_info
    @employment = params[:employed]
  end
  
  def general_info_check
    redirect_to welcome_skills_path
  end

  def skills

  end

  def skills_check
    redirect_to welcome_emergency_notification_path
  end

  def emergency_notification

  end

  def emergency_notification_check
    redirect_to :back
  end

end
