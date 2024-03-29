class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
   else
       render :new
   end
 end

 def destroy
   session[:user_id] = nil
   redirect_to root_path
 end

end
