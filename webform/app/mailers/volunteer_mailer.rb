class VolunteerMailer < ApplicationMailer
    def application_email(receiver, directory, type)
        # receiver is the email to be sent to
        # directory is the full directory of the pdf to be attached
        # type should be "Application" or "Reference"
        title = type + ' Submition'
        filename = directory.split("/").last
        attachments[filename] = File.read(directory)
        mail(to: receiver, subject: title)
    end
    def test_email
        receiver = "stevensnow58@gmail.com"
        title = 'Test Email'
        body = 'This is my test email body.'
        attachments["Adam_Albrecht_Copyright_Release.pdf"] = File.read("#{Rails.root}/Adam_Albrecht_Copyright_Release.pdf")
        mail(to: receiver, subject: title, body: body)
    end
end
