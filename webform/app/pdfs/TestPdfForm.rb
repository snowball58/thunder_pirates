#Copyright Adam Albrecht 2014, 
#Source: http://adamalbrecht.com/2014/01/31/pre-filling-pdf-form-templates-in-ruby-on-rails-with-pdftk/

class TestPdfForm < FillablePdfForm

  def initialize(user)
    @user = user
    super()
  end

  protected

  def fill_out
    fill :date, Date.today.to_s
    [:first_name, :last_name, :address, :address_2, :city, :state, :zip_code].each do |field|
      fill field, @user.send(field)
    end
    fill :age, case @user.age
      when nil then nil
      when 0..17 then '0_17'
      when 18..34 then '18_34'
      when 35..54 then '35_54'
      else '55_plus'
    end
    fill :comments, "Hello, World"
  end
end