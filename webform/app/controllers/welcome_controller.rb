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
    #convoluted example, but makes the point
    if session[:uniqueID].blank? or not Volunteer.exists?(:uniqueID => session[:uniqueID])
      uniqueID = SecureRandom.base64
      while Volunteer.exists?(:uniqueID => uniqueID) do
        uniqueID = SecureRandom.base64
      end
      b = Volunteer.new
      b.uniqueID = uniqueID
      b.save
      session[:uniqueID] = uniqueID
    else
      volunteer = Volunteer.find_by_uniqueID(session[:uniqueID])
      # query the text fields like this
      @name = volunteer[:Name]
      @birth = volunteer[:DateofBirth]
      @email = volunteer[:EmailAddress]
      @phone = volunteer[:PhoneNumbers]
      @address = volunteer[:MailingAddress]
      @county = volunteer[:County]
      @additional = volunteer[:IfyouhaveselectedAdditionalVolunteerOpportunitiespleasespecify]
      @times = volunteer[:DaysTimesyouwillbeavailabletovolunteer]
      
      # query check boxes like this
      # if box is saved as not being checked, should have empty value in database!
      # if box is saved as being checked, should have "Yes" as value for pdf purposes
      @family_care = volunteer[:FamilyCare]
      @ambassador = volunteer[:Ambassador]
      @virtual_volunteer = volunteer[:VirtualVolunteer]
      @medical_volunteer = volunteer[:MedicalVolunteer]
      @counseling_internship = volunteer[:ProgramCounselingInternship]
      @outlying_county = volunteer[:OutlyingCountyAmbassadorProgram] 
      @additionl_opportunities = volunteer[:AdditionalVolunteerOpportunities]
    end
  end
  
  def volunteer_check
    #some fields might be required later
    volunteer = Volunteer.find_by_uniqueID(session[:uniqueID])
    
    #this is how you change text fields in the database
    volunteer.Name = params[:name]
    volunteer.DateofBirth = params[:birth]
    volunteer.EmailAddress = params[:email]
    volunteer.PhoneNumbers = params[:phone]
    volunteer.MailingAddress = params[:address]
    volunteer.County = params[:county]
    volunteer.IfyouhaveselectedAdditionalVolunteerOpportunitiespleasespecify = params[:additional]
    volunteer.DaysTimesyouwillbeavailabletovolunteer = params[:times]
    
    #this is where I fill in the date of the application
    time = Time.new
    volunteer.DateofApplication = time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s
    puts volunteer.DateofApplication
    
    #this is how to change check boxes in the database
    volunteer.FamilyCare = params[:family]
    volunteer.Ambassador = params[:ambassador]
    volunteer.VirtualVolunteer = params[:virtual]
    volunteer.MedicalVolunteer = params[:medical]
    volunteer.ProgramCounselingInternship = params[:counseling]
    volunteer.OutlyingCountyAmbassadorProgram = params[:outlying]
    volunteer.AdditionalVolunteerOpportunities = params[:additional2]
    
    # save the changes made to the volunteer entry
    volunteer.save
    redirect_to welcome_general_info_path
  end
  
  def general_info
    # Check that the current user has an ID set on first page
    volunteer = Volunteer.find_by_uniqueID(session[:uniqueID])
    if volunteer == nil
      redirect_to welcome_index_path
    end
    
    @program_source		= volunteer[:HowdidyoulearnaboutScottysHouseandourVolunteerProgram]
    @experience_gain	= volunteer[:Whatwouldyouliketogainfromyourvolunteerexperience]
    @reason_class_credit= volunteer[:ClassCredit]
    @instructor_name	= volunteer[:NameofInstructor]    
    @reason_org_credit	= volunteer[:OrganizationCredit]
    @organization_name	= volunteer[:NameofOrganization]              
    @reason_other		= volunteer[:Other]
    @explanation		= volunteer[:OtherPleaseexplain]              
    @employed			= volunteer[:CurrentlyEmployed]
	@employer_name		= volunteer[:NameofEmployer]
	
  end
  
  def general_info_check
    # Check that the current user has an ID set on first page
    volunteer = Volunteer.find_by_uniqueID(session[:uniqueID])
    if volunteer == nil
      redirect_to welcome_index_path
    end
    
    volunteer.HowdidyoulearnaboutScottysHouseandourVolunteerProgram	= params[:program_source]
    volunteer.Whatwouldyouliketogainfromyourvolunteerexperience 	= params[:experience_gain]
    
    reason = params[:reason]
    if reason == "class_credit" then
      volunteer.ClassCredit = reason
      volunteer.NameofInstructor = params[:instructor_name]
    elsif reason == "org_credit" then
      volunteer.OrganizationCredit = reason
      volunteer.NameofOrganization = params[:organization_name]
    elsif reason == "other" then
      volunteer.Other = reason
      volunteer.OtherPleaseexplain = params[:explanation]
    end
          
    employment = params[:employed]
    if employment == "yes" then
      volunteer.CurrentlyEmployed = employment
      volunteer.NameofEmployer = params[:employer_name]
    end
    
    volunteer.save
    redirect_to welcome_experience_path
  end

  def experience
    
    volunteer = Volunteer.find_by_uniqueID(session[:uniqueID])
    if volunteer == nil
      flash[:notice] = "We couldn't find your data, start the form from the beggining."
      redirect_to welcome_index_path
    end

    # Fix number of experiences parameter
    if volunteer[:NofExperiences] == nil
      volunteer.NofExperiences = 1
    end
    nof_experiences = volunteer[:NofExperiences]
    if params[:nof_experiences] == nil || params[:nof_experiences].to_i != nof_experiences.to_i
      redirect_to welcome_experience_path :nof_experiences => nof_experiences
    end

    @length_of_time_1 = volunteer[:LengthofTime1]
    @length_of_time_2 = volunteer[:LengthofTime2]
    @length_of_time_3 = volunteer[:LengthofTime3]
    @length_of_time_4 = volunteer[:LengthofTime4]
    @length_of_time_5 = volunteer[:LengthofTime5]
    @organization_1 = volunteer[:Organization1]
    @organization_2 = volunteer[:Organization2]
    @organization_3 = volunteer[:Organization3]
    @organization_4 = volunteer[:Organization4]
    @organization_5 = volunteer[:Organization5]
    @responsabilities_1 = volunteer[:Responsabilities1]
    @responsabilities_2 = volunteer[:Responsabilities2]
    @responsabilities_3 = volunteer[:Responsabilities3]
    @responsabilities_4 = volunteer[:Responsabilities4]
    @responsabilities_5 = volunteer[:Responsabilities5]
    @child_abuse_check = volunteer[:ExperiencewithChildAbuseYES]
    @child_abuse_text = volunteer[:ExperiencewithChildAbuse]
    @foster_care_check = volunteer[:ExperiencewithFosterCareYES]
    @foster_care_text = volunteer[:ExperiencewithFosterCare]
    @criminal_check = volunteer[:ExperiencewithCourtYES]
    @criminal_text = volunteer[:CriminalJuvenileorFamilyCourtSystem]
    @agency_check = volunteer[:ExperiencewithChildServiceYES]
    @agency_text = volunteer[:OtherChildServiceAgencies]
  end

  def experience_check
    volunteer = Volunteer.find_by_uniqueID(session[:uniqueID])

    if volunteer != nil
      volunteer.LengthofTime1 = params[:length_of_time_1]
      volunteer.LengthofTime2 = params[:length_of_time_2]
      volunteer.LengthofTime3 = params[:length_of_time_3]
      volunteer.LengthofTime4 = params[:length_of_time_4]
      volunteer.LengthofTime5 = params[:length_of_time_5]
      volunteer.Organization1 = params[:organization_1]
      volunteer.Organization2 = params[:organization_2]
      volunteer.Organization3 = params[:organization_3]
      volunteer.Organization4 = params[:organization_4]
      volunteer.Organization5 = params[:organization_5]
      volunteer.Responsibilities1 = params[:resposabilities_1]
      volunteer.Responsibilities2 = params[:resposabilities_2]
      volunteer.Responsibilities3 = params[:resposabilities_3]
      volunteer.Responsibilities4 = params[:resposabilities_4]
      volunteer.Responsibilities5 = params[:resposabilities_5]
      volunteer.ExperiencewithChildAbuseYES = params[:child_abuse_check]
      volunteer.ExperiencewithChildAbuseNO = !params[:child_abuse_check]
      volunteer.ExperiencewithChildAbuse = params[:child_abuse_text]
      volunteer.ExperiencewithFosterCareYES = params[:foster_care_check]
      volunteer.ExperiencewithFosterCareNO = !params[:foster_care_check]
      volunteer.ExperiencewithFosterCare = params[:foster_care_text]
      volunteer.ExperiencewithCourtYES = params[:criminal_check]
      volunteer.ExperiencewithCourtNO = !params[:criminal_check]
      volunteer.CriminalJuvenileorFamilyCourtSystem = params[:criminal_text]
      volunteer.ExperiencewithChildServiceYES = params[:agency_check]
      volunteer.ExperiencewithChildServiceNO = !params[:agency_check]
      volunteer.OtherChildServiceAgencies  = params[:agency_text]
      volunteer.save
    end

    if params[:commit] == "Add Experience"
      volunteer.NofExperiences = 1 + params[:nof_experiences].to_i
      volunteer.save
      redirect_to welcome_experience_path :nof_experiences => volunteer[:NofExperiences].to_s
    elsif params[:commit] == "Continue"
      redirect_to welcome_skills_path
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
    #user = User.new()
    #respond_to do |format|
      #format.pdf { send_file TestPdfForm.new(user).export, type: 'application/pdf' }
    #send_file TestPdfForm.new(user).export, type: 'application/pdf' , :disposition => 'inline'
    # =>end
    record = Volunteer.find_by_uniqueID(session[:uniqueID])
    send_file ScottyPDF.new(record).export('/tmp/#{SecureRandom.uuid}.pdf'), type: 'application/pdf' , :disposition => 'inline', :stream => false
  end

end
