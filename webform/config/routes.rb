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

require 'FillablePdfForm'
require 'TestPdfForm'
require 'ScottyPDF'
require 'RefPDF'
require 'User'

Rails.application.routes.draw do
  default_url_options host: Rails.application.config.domain
  devise_for :auth_users, controllers: { sessions: "admin/sessions" }, :skip => [:registrations]
  as :auth_user do
    get 'auth_users/edit' => 'devise/registrations#edit', :as => 'edit_auth_user_registration'
    put 'auth_users' => 'devise/registrations#update', :as => 'auth_user_registration'
  end
  get 'admin/new_user' => 'admin#new_user'
  post 'admin/new_user' => 'admin#create_user'
  get 'admin/show_users' => 'admin#show_users'
  delete 'admin/delete_user' => 'admin#delete_user'
  get 'admin' => 'admin#index', as: :auth_user_root # creates user_root_path
  get 'admin/query_volunteer', :to => 'admin#query_volunteer'
  post 'admin/query_volunteer', :to => 'admin#query_volunteer'
  get 'admin/show_volunteer/:id' => 'admin#show_volunteer', as: :admin_show_volunteer
  get 'admin/delete_volunteer/:id' => 'admin#delete_volunteer', as: :admin_delete_volunteer
  get 'admin/volunteer_pdf/:id', :to => 'admin#volunteer_pdf', as: :admin_volunteer_pdf
  get 'admin/reference_pdf/:id', :to => 'admin#reference_pdf', as: :admin_reference_pdf

  root 'welcome#index'
  get 'welcome/index', :to => 'welcome#index'
  post 'welcome/index', :to => 'welcome#index_check'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'welcome/volunteer', :to => 'welcome#volunteer'
  post 'welcome/volunteer', :to => 'welcome#volunteer_check'

  get 'welcome/general_info', :to => 'welcome#general_info'
  post 'welcome/general_info', :to => 'welcome#general_info_check'

  get 'welcome/experience', :to => 'welcome#experience'
  post 'welcome/experience', :to => 'welcome#experience_check'

  get 'welcome/skills', :to => 'welcome#skills'
  post 'welcome/skills', :to => 'welcome#skills_check'

  get 'welcome/emergency_notification', :to => 'welcome#emergency_notification'
  post 'welcome/emergency_notification', :to => 'welcome#emergency_notification_check'

  get 'welcome/reference_form_emails', :to => 'welcome#reference_form_emails'
  post 'welcome/reference_form_emails', :to => 'welcome#reference_form_emails_check'

  get 'welcome/reference_form', :to => 'welcome#reference_form'
  post 'welcome/reference_form', :to => 'welcome#reference_form_check'

  get 'welcome/status', :to => 'welcome#status'
  post 'welcome/status', :to => 'welcome#status_check'
  
  get 'welcome/completed_status', :to => 'welcome#completed_status'
  post 'welcome/completed_status', :to => 'welcome#completed_status_check'

  get 'welcome/review', :to => 'welcome#review'
  post 'welcome/review', :to => 'welcome#review_check'

  get 'welcome/thank_you', :to => 'welcome#thank_you'

  get 'pdf', :to => 'welcome#pdf'

  get 'refpdf', :to => 'welcome#refpdf'
end
