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

class AdminController < ApplicationController
  before_filter :authenticate_auth_user!
  layout 'admin'
  def index
  
  end
  
  def new_user
      puts 'Hi'
  end
  
  def create_user
      user = AuthUser.new(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
      user.save
      redirect_to auth_user_root_path
  end
  
  def show_users
    @current_email = current_auth_user.email
    @users = AuthUser.where('email != ? ', current_auth_user.email)
  end
  
  def delete_user
    user = AuthUser.find(params[:id])
    user.destroy
    
    redirect_to admin_show_users_path
  end
  
end