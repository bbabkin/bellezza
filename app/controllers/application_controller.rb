class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
 before_filter :brk
  def brk
    @brk = "<br/>".html_safe
    @divin = "<div class='line_buttons'>".html_safe
    @divinb = "<div class='cat_buttons'>".html_safe
    @divout = "</div>".html_safe

    # intro text
  end

  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      return false # halts the before_action
    else
      return true
    end
  end

end
