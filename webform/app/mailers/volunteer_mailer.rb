class VolunteerMailer < ApplicationMailer
    def application_email(type, receiver, args)
        # receiver is the email to be sent to
        # directory is the full directory of the pdf to be attached
        # type should be "Application" or "Reference"
        if type == "submission"
            title = 'Completed Volunteer Application'
            body = 'This is an automated message containing a completed volunteer application!'
            attachments["application.pdf"] = File.read(args[0])
            #args.each do |dir|
                #filename = dir.split("/").last
                #attachments[filename] = File.read(dir)
            #end
            mail(to: receiver, subject: title, body: body)
        elsif type == "reference"
            title = "Scotty's House Applicant Reference Request"
            body = args[:name] + " has applied to Scotty's House Child Advocacy Center, and has requested you as a reference.\n\n"
            body = body + "Please fill out the reference form here: " + args[:url]
            mail(to: receiver, subject: title, body: body)
        elsif type == "applicant"
            title = "Application Confirmation - Scotty's House"
            body = "Thank you for applying to volunteer at Scotty's House Child Advocacy Center!\n\n"
            body = body + "You can view your application with this link: " + args[:url] + "\n\n"
            body = body + "The application will not be considered until all references are submitted."
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
