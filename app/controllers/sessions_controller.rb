class SessionsController < ApplicationController
  # before_action :logged_in?
  def login
    if request.post?
      teacher = Teacher.find_by_email(params[:email])
      student = Student.find_by_email(params[:email])
      parent = Parent.find_by_email(params[:email])
      if teacher && teacher.authenticate(params[:password])
        session[:user_id] = teacher.id
        session[:user_type] = "teacher"
        redirect_to teachers_path, notice: "You've successfully logged in."
      elsif student && student.authenticate(params[:password])
        session[:user_id] = student.id
        session[:user_type] = "student"
        redirect_to students_path, notice: "You've successfully logged in."
      elsif parent && parent.authenticate(params[:password])
        session[:user_id] = parent.id
        session[:user_type] = "parent"
        redirect_to parents_path, notice: "You've successfully logged in."
      else
        flash.now[:notice] = "Incorrect password, try agian."
      end
    end
  end

  def logout
    # reset_session
    session[:user_id] = nil
    session[:user_type] = nil
    redirect_to sessions_login_path, notice: "Logged Out."
  end

  private def logged_in?

    # if session[:user_id] == nil
    #   redirect_to sessions_login_path
    # elsif session[:user_type] == "parent"
    #   redirect_to parents_path
    # elsif session[:user_type] == "student"
    #   redirect_to students_path
    # elsif session[:user_type] == "teacher"
    #   redirect_to teachers_path
    # end
  end
end
