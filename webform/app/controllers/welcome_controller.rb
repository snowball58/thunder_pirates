# Scotty's House Volunteer WebForm
# Written in 2016 by: 
# Gustavo Estrela
# Logan Ford
# Patrick Herrington
# Noemie Nakamura
# Steven Snow
# Matthew Wiecek
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

class WelcomeController < ApplicationController
  
  def index
    
  end
  
  def index_check
    # check input, other processing here
    redirect_to welcome_volunteer_path # go to next if everything is good
  end
  
  def volunteer
    @test = session[:test]
  end
  
  def volunteer_check
    session[:test] = params[:name]
    redirect_to welcome_general_info_path
  end
  
  def general_info
    @employment = params[:employed]
  end
  
  def general_info_check
    redirect_to welcome_experience_path
  end

  def experience
    if params[:nof_experiences] == nil || params[:nof_experiences].to_i < 1
      redirect_to welcome_experience_path :nof_experiences => 1
    end
  end

  def experience_check
    if params[:commit] == "New Experience"
      params[:nof_experiences] = params[:nof_experiences].to_i + 1
      redirect_to welcome_experience_path params
    elsif params[:commit] == "Continue"
      redirect_to welcome_skills_path params
    end
  end

  def skills

  end

  def skills_check
    redirect_to welcome_emergency_notification_path
  end

  def emergency_notification

  end

  def emergency_notification_check
    redirect_to welcome_reference_form_emails_path
  end
  
  def reference_form_emails
   
  end
  
  def reference_form_emails_check
    redirect_to welcome_reference_form_path
  end
  
  def reference_form
   
  end
  
  def reference_form_check
    redirect_to welcome_reference_form_path
  end
  
  def pdf
    #user = User.find(params[:id])
    user = User.new()
    #respond_to do |format|
      #format.pdf { send_file TestPdfForm.new(user).export, type: 'application/pdf' }
    send_file TestPdfForm.new(user).export, type: 'application/pdf' , :disposition => 'inline'
    # =>end
  end

end
