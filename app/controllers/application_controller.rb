class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:create]
  # before_action :authenticate_user!
    # before_action :after_sign_in_path_for 
  before_action :configure_premitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:devise, :new]
  # def show
    #     @user = User.all
    # end    
    protected

    #  def resource_name
    #     :user
    # end
    # def resource_name_request
    #     :request
    # end
    # def resource
    #     @resource ||= User.new
    # end
    # helper_method :resource
    
    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end
     helper_method :devise_mapping
    
    # def resource_class
    #     User
    # end
    # helper_method :resource_class
   
# def after_sign_in_path_for

# #  def after_sign_in_path_for
#   #session[:previous_url] ||
#     if user_signed_in? && current_user.role == "teacher"
#       redirect_to home_index_path
#     else
#       redirect_to new_user_session_path
#     end

# end
  #  def after_sign_in_path_for(resource)

  # #  def after_sign_in_path_for
  #    #session[:previous_url] ||
  #     if resource.user_signed_in && current_user.role == "teacher"
  #       redirect_to home_index_path
  #     else
  #       redirect_to new_user_session_path
  #     end

  #  end

  protected
    def configure_premitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role])
    end
end