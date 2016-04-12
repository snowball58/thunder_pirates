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
  layout 'welcome'
  
  def index
  
  end

  # This function finds the user in the database. If he's not, the user will be 
  # redirected to the index
  def checkin_user
    volunteer = Volunteer.find_by_uniqueID(session[:uniqueID])
    if volunteer == nil
      flash[:notice] = "We couldn't find your data, start the form from the beggining."
      redirect_to welcome_index_path and return
    end
    volunteer
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
      @home_phone = volunteer[:HomePhone]
      @cell_phone = volunteer[:CellPhone]
      @street = volunteer[:Street]
      @city = volunteer[:City]
      @state = volunteer[:State]
      @zip = volunteer[:Zip]
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
    
    #set timestamp modified
    volunteer.date_modified = Time.now
    
    #this is how you change text fields in the database
    volunteer.Name = params[:name]
    volunteer.DateofBirth = params[:birth]
    volunteer.EmailAddress = params[:email]
    volunteer.HomePhone = params[:home_phone]
    volunteer.CellPhone = params[:cell_phone]
    numbers = ""
    if(not params[:home_phone].blank?)
      numbers = "Home: " + params[:home_phone] + "     "
    end
    if(not params[:cell_phone].blank?)
      numbers = numbers + "Cell: " + params[:cell_phone]
    end
    volunteer.PhoneNumbers = numbers
    volunteer.Street = params[:street]
    volunteer.City = params[:city]
    volunteer.State = params[:state]
    volunteer.Zip = params[:zip]
    volunteer.MailingAddress = params[:street] + ", " + params[:city] + ", " + params[:state] + ", " + params[:zip]
    volunteer.County = params[:county]
    volunteer.IfyouhaveselectedAdditionalVolunteerOpportunitiespleasespecify = params[:additional]
    volunteer.DaysTimesyouwillbeavailabletovolunteer = params[:times]
    
    #this is where I fill in the date of the application
    time = Time.new
    #volunteer.date_modified = DateTime.new
    volunteer.DateofApplication = time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s
    #puts volunteer.DateofApplication
    
    #this is how to change check boxes in the database
    volunteer.FamilyCare = params[:family]
    volunteer.Ambassador = params[:ambassador]
    volunteer.VirtualVolunteer = params[:virtual]
    volunteer.MedicalVolunteer = params[:medical]
    volunteer.ProgramCounselingInternship = params[:counseling]
    volunteer.OutlyingCountyAmbassadorProgram = params[:outlying]
    volunteer.AdditionalVolunteerOpportunities = params[:additional2]
    
    #save before checking to save other input from user
    volunteer.save
    
    flash[:notice] = nil;
    # check for required fields before moving on to the next page
    if params[:name].blank?
      flash[:notice] = "Name field required."
      redirect_to welcome_volunteer_path
      return
    end
    if params[:birth].blank?
      flash[:notice] = "Date of Birth field required."
      redirect_to welcome_volunteer_path
      return
    end
    if params[:email].blank?
      flash[:notice] = "Email field required."
      redirect_to welcome_volunteer_path
      return
    end
    if params[:street].blank?
      flash[:notice] = "Street Address / Appartment Number field required."
      redirect_to welcome_volunteer_path
      return
    end
    if params[:city].blank?
      flash[:notice] = "City field required."
      redirect_to welcome_volunteer_path
      return
    end
    if params[:state].blank?
      flash[:notice] = "State field required."
      redirect_to welcome_volunteer_path
      return
    end
    if params[:zip].blank?
      flash[:notice] = "Zip Code field required."
      redirect_to welcome_volunteer_path
      return
    end
    if params[:home_phone].blank? and params[:cell_phone].blank?
      flash[:notice] = "At least one phone number required."
      redirect_to welcome_volunteer_path
      return
    end

    redirect_to welcome_general_info_path
  end
  
  def general_info
    # Check that the current user has an ID set on first page
    volunteer = checkin_user
    return if !volunteer
    
    @program_source = volunteer[:HowdidyoulearnaboutScottysHouseandourVolunteerProgram]
    @experience_gain = volunteer[:Whatwouldyouliketogainfromyourvolunteerexperience]
    @reason_class_credit = volunteer[:ClassCredit]
    @instructor_name = volunteer[:NameofInstructor]    
    @reason_org_credit = volunteer[:OrganizationCredit]
    @organization_name = volunteer[:NameofOrganization]              
    @reason_other = volunteer[:Other]
    @explanation = volunteer[:OtherPleaseexplain]              
    @employed = volunteer[:CurrentlyEmployed]
    @employer_name = volunteer[:NameofEmployer]
  
  end
  
  def general_info_check
    # Check that the current user has an ID set on first page
    volunteer = checkin_user
    return if !volunteer
    
    volunteer.date_modified = Time.now
    volunteer.HowdidyoulearnaboutScottysHouseandourVolunteerProgram = params[:program_source]
    volunteer.Whatwouldyouliketogainfromyourvolunteerexperience   = params[:experience_gain]
    
    reason = params[:reason]
    if reason == "class_credit" then
      volunteer.ClassCredit = "Yes"
      volunteer.OrganizationCredit = "No"      
      volunteer.Other = "No"
      volunteer.NameofInstructor = params[:instructor_name]
    elsif reason == "org_credit" then
      volunteer.ClassCredit = "No"
      volunteer.OrganizationCredit = "Yes"      
      volunteer.Other = "No"
      volunteer.NameofOrganization = params[:organization_name]
    elsif reason == "other" then
      volunteer.ClassCredit = "No"
      volunteer.OrganizationCredit = "No"      
      volunteer.Other = "Yes"
      volunteer.OtherPleaseexplain = params[:explanation]
    end
          
    employment = params[:employed]
    if employment == "yes" then
      volunteer.CurrentlyEmployed = "Yes"
      volunteer.NameofEmployer = params[:employer_name]
    end
    volunteer.save
    redirect_to welcome_experience_path
  end

  def experience
    volunteer = checkin_user
    return if !volunteer

    # Fix number of experiences parameter
    if volunteer[:NofExperiences] == nil
      volunteer.NofExperiences = 1
    end
    if volunteer[:NofExperiences] > 5
      volunteer.NofExperiences = 5
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
    @responsibilities_1 = volunteer[:Responsibilities1]
    @responsibilities_2 = volunteer[:Responsibilities2]
    @responsibilities_3 = volunteer[:Responsibilities3]
    @responsibilities_4 = volunteer[:Responsibilities4]
    @responsibilities_5 = volunteer[:Responsibilities5]
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
    volunteer = checkin_user
    return if !volunteer

    no_checkbox_map = Hash.new ""
    no_checkbox_map[nil] = "Yes"

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
      volunteer.Responsibilities1 = params[:responsibilities_1]
      volunteer.Responsibilities2 = params[:responsibilities_2]
      volunteer.Responsibilities3 = params[:responsibilities_3]
      volunteer.Responsibilities4 = params[:responsibilities_4]
      volunteer.Responsibilities5 = params[:responsibilities_5]
      volunteer.ExperiencewithChildAbuseYES = params[:child_abuse_check]
      volunteer.ExperiencewithChildAbuseNO = no_checkbox_map[params[:child_abuse_check]]
      volunteer.ExperiencewithChildAbuse = params[:child_abuse_text]
      volunteer.ExperiencewithFosterCareYES = params[:foster_care_check]
      volunteer.ExperiencewithFosterCareNO = no_checkbox_map[params[:foster_care_check]]
      volunteer.ExperiencewithFosterCare = params[:foster_care_text]
      volunteer.ExperiencewithCourtYES = params[:criminal_check]
      volunteer.ExperiencewithCourtNO = no_checkbox_map[params[:criminal_check]]
      volunteer.CriminalJuvenileorFamilyCourtSystem = params[:criminal_text]
      volunteer.ExperiencewithChildServiceYES = params[:agency_check]
      volunteer.ExperiencewithChildServiceNO = no_checkbox_map[params[:agency_check]]
      volunteer.OtherChildServiceAgencies  = params[:agency_text]
      volunteer.date_modified = Time.now
      volunteer.save
    end

    if params[:commit] == "Add Experience"
      if params[:nof_experiences].to_i < 5
        volunteer.NofExperiences = 1 + params[:nof_experiences].to_i
        volunteer.save
      end
      redirect_to welcome_experience_path :nof_experiences => volunteer[:NofExperiences].to_s
    elsif params[:commit] == "Continue"
      redirect_to welcome_skills_path
    end

  end

  def skills
    
    volunteer = checkin_user
    return if !volunteer

    @multilingual_speaker = volunteer[:SpeakotherlanguageYES]
    @speaking_languages = volunteer[:Speaklanguage]
    @multilingual_reader = volunteer[:LiterateotherlanguageYES]
    @reading_languages = volunteer[:Literatelanguage]
    @impaired_experience = volunteer[:ExperiencewithblinddeafpersonsYES]
    @impaired_capacity = volunteer[:Experiencewithblinddeafpersons]
    @handicapped_experience = volunteer[:ExperiencewithhandicappersonsYES]
    @handicapped_capacity = volunteer[:Experiencewithhandicappersons]
  end

  def skills_check
    volunteer = Volunteer.find_by_uniqueID(session[:uniqueID])

    if volunteer != nil
      volunteer.SpeakotherlanguageYES = params[:multilingual_speaker]
      if volunteer.SpeakotherlanguageYES == "Yes"
        volunteer.SpeakotherlanguageNO = "no"
      else 
        volunteer.SpeakotherlanguageNO = "Yes"
      end
      volunteer.Speaklanguage = params[:speaking_languages]
      volunteer.LiterateotherlanguageYES = params[:multilingual_reader]
      if volunteer.LiterateotherlanguageYES == "Yes"
        volunteer.LiterateotherlanguageNO = "no"
      else 
        volunteer.LiterateotherlanguageNO = "Yes"
      end
      volunteer.Literatelanguage = params[:reading_languages]
      volunteer.ExperiencewithblinddeafpersonsYES = params[:impaired_experience]
      if volunteer.ExperiencewithblinddeafpersonsYES == "Yes"
        volunteer.ExperiencewithblinddeafpersonsNO = "no"
      else 
        volunteer.ExperiencewithblinddeafpersonsNO = "Yes"
      end
      volunteer.Experiencewithblinddeafpersons = params[:impaired_capacity]
      volunteer.ExperiencewithhandicappersonsYES = params[:handicapped_experience]
      if volunteer.ExperiencewithhandicappersonsYES == "Yes" 
        volunteer.ExperiencewithhandicappersonsNO = "no"
      else 
        volunteer.ExperiencewithhandicappersonsNO = "Yes"
      end
      volunteer.Experiencewithhandicappersons = params[:handicapped_capacity]
      volunteer.date_modified = Time.now
      volunteer.save
    end
    redirect_to welcome_emergency_notification_path
  end

  def emergency_notification
    volunteer = checkin_user
    return if !volunteer

    @emergency_name = volunteer[:EmergencyName]
    @emergency_primary_phone = volunteer[:EmergencyPhone]
    @emergency_address = volunteer[:EmergencyAddress]
    @emergency_relationship = volunteer[:EmergencyRelationship]
  end

  def emergency_notification_check
    
    volunteer = Volunteer.find_by_uniqueID(session[:uniqueID])

    if volunteer != nil
      volunteer.EmergencyName = params[:emergency_name]
      volunteer.EmergencyPhone = params[:emergency_primary_phone]
      volunteer.EmergencyAddress = params[:emergency_address]
      volunteer.EmergencyRelationship = params[:emergency_relationship]
      volunteer.date_modified = Time.now
      volunteer.save
    end
    
    redirect_to welcome_reference_form_emails_path
  end
  
  def reference_form_emails
    volunteer = checkin_user
    return if !volunteer
    @ref_id = session[:uniqueID]
  end
  
  def reference_form_emails_check
    volunteer = Volunteer.find_by_uniqueID(session[:uniqueID])
    
    if volunteer != nil
      #need way to set emails
      volunteer.date_modified = Time.now
      volunteer.save
    end
    
    redirect_to welcome_reference_form_path
  end
  
  def reference_form
    if params[:ref_id] != nil && session[:ref_unique_id] == nil
      uID = SecureRandom.base64
      while Reference.exists?(:uniqueID => uID) do
        uID = SecureRandom.base64
      end
      b = Reference.new
      b.uniqueID = uID
      b.VolunteerId = params[:ref_id]
      b.date_modified = Time.now
      b.save
      session[:ref_unique_id] = uID
    end
    if (params[:ref_id] == nil && session[:ref_unique_id] != nil) or (params[:ref_id] != nil && session[:ref_unique_id] != nil)
      reference = Reference.find_by_uniqueID(session[:ref_unique_id])
      @reference_name = reference.VolunteerName
      @reference_form_area_1 = reference.Howlonghaveyouknownthisperson
      @reference_form_area_2 = reference.Cableincrisissituationwhy
      @reference_form_area_3 = reference.Doesthispersonusuallyexercisegoodjudgment
      @reference_form_area_4 = reference.Doyouhaveanyhesitationaboutthispersonworkinginthiscapacity
      @reference_form_area_5 = reference.PertinentInformation
    end
    if params[:ref_id] == nil && session[:ref_unique_id] == nil
      #need an error page to redirect to
    end
  end
  
  def reference_form_check
    reference = Reference.find_by_uniqueID(session[:ref_unique_id])
    
      if reference != nil
        reference.VolunteerName = params[:reference_name]
        reference.Howlonghaveyouknownthisperson = params[:reference_form_area_1]
        reference.Cableincrisissituationwhy = params[:reference_form_area_2]
        reference.Doesthispersonusuallyexercisegoodjudgment = params[:reference_form_area_3]
        reference.Doyouhaveanyhesitationaboutthispersonworkinginthiscapacity = params[:reference_form_area_4]
        reference.PertinentInformation = params[:reference_form_area_5]
        reference.date_modified = Time.now
        reference.save
      end
    
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