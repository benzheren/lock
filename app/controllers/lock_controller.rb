class LockController < ApplicationController
  def unlock
    if Lock.passwords_match?(params[:password])
      session[:lock_pw_error] = false
      session[:lock_opened] = true
      redirect_to new_user_registration_url 
    else
      session[:lock_pw_error] = true
      redirect_to :action=>:login
    end
  end
end
