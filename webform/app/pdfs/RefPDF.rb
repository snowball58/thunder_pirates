#Scotty's House Volunteer WebForm
#This class written in 2016 by Matthew Wiecek matthewwiecek@tamu.edu
#To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
#You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

class RefPDF < FillablePdfForm

  def initialize(user)
    @user = user
    @template_path = "#{Rails.root}/lib/pdf_templates/Reference.pdf"
    super()
  end

  protected

  def fill_out
    @user.attribute_names.each do |field|
      fill field, @user.send(field)
    end
  end
end