class VolunteerMailer < ApplicationMailer
    def application_email(type, receiver, args)
        # receiver is the email to be sent to
        # directory is the full directory of the pdf to be attached
        # type should be "submission", "reference", or applicant
        if type == "submission"
            # I destroy the volunteer and all references after getting the pdfs
            # do this because application process is now complete
            title = 'Completed Volunteer Application'
            body = 'This is an automated message containing a completed volunteer application!'
            record = Volunteer.find_by_uniqueID(args[0])
            refs = Reference.where(:VolunteerId => args[0])
            attachments["application.pdf"] = File.read(ScottyPDF.new(record).export('/tmp/application.pdf'))
            refs.each do |ref|
                attachments["#{ref.uniqueID}.pdf"] = File.read(RefPDF.new(ref).export('/tmp/Ref.pdf'))
            end

            mail(to: receiver, subject: title, body: body)
        elsif type == "reference"
            title = "Scotty's House Applicant Reference Request"
            body = args[:name] + " has applied to Scotty's House Child Advocacy Center, and has requested you as a reference.\n\n"
            body = body + "Please fill out the reference form here: " + args[:url]
            mail(to: receiver, subject: title, body: body)
        elsif type == "applicant"
            title = "Application Confirmation - Scotty's House"
            body = "Thank you for applying to volunteer at Scotty's House Child Advocacy Center!\n\n"
            body = body + "You can view your application status with this link: " + args[:url] + "\n\n"
            body = body + "If you need to, give this link out to any references you didn't give an email for: " + args[:url2] + "\n\n"
            body = body + "The application will not be considered until all  3 references have submitted to us."
            mail(to: receiver, subject: title, body: body)
        else
            #invalid email type
        end
    end
    def test_email
        receiver = "stevensnow58@gmail.com"
        title = 'Test Email'
        body = "https://www.reddit.com/"
        attachments["Adam_Albrecht_Copyright_Release.pdf"] = File.read("#{Rails.root}/Adam_Albrecht_Copyright_Release.pdf")
        mail(to: receiver, subject: title, body: body)
    end
end
