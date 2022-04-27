class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :authorized

    def set_current_user
      if session[:user_id]
       Current.user = User.find_by(id: session[:user_id])   
      end
    end

    def logged_in?
      Current.user
    end

    def authorized
      redirect_to root_path unless logged_in?
    end
end
