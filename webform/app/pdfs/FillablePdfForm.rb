#Copyright Adam Albrecht 2014, used with permission
#Source: http://adamalbrecht.com/2014/01/31/pre-filling-pdf-form-templates-in-ruby-on-rails-with-pdftk/

class FillablePdfForm

  attr_writer :template_path
  attr_reader :attributes

  def initialize
    fill_out
  end

  def export(output_file_path=nil)
    output_path = output_file_path || "#{Rails.root}/tmp/pdfs/#{SecureRandom.uuid}.pdf" # make sure tmp/pdfs exists
    pdftk.fill_form template_path, output_path, attributes
    output_path
  end

  def get_field_names 
    pdftk.get_field_names template_path
  end

  def template_path
    @template_path ||= "#{Rails.root}/lib/pdf_templates/#{self.class.name.gsub('Pdf', '').underscore}.pdf" # makes assumption about template file path unless otherwise specified
  end

  protected

  def attributes
    @attributes ||= {}
  end

  def fill(key, value)
    attributes[key.to_s] = value
  end

  def pdftk
    @pdftk ||= PdfForms.new(ENV['PDFTK_PATH'] || '/usr/bin/pdftk') # On my Mac, the location of pdftk was different than on my linux server.
  end

  def fill_out
    raise 'Must be overridden by child class'
  end

end