class ApplicationController < ActionController::Base
    before_action :set_current_user
  
    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end
    
    def authenticate_user
      if @current_user == nil
        redirect_to("/users/login_form")
      end
    end
    
    def forbid_login_user
      if @current_user
        redirect_to("/users/index")
      end
    end
end
