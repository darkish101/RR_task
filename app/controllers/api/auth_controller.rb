class Api::AuthController < Devise::SessionsController
  #  def create
  #   self.resource = warden.authenticate!(auth_options)
  #   sign_in(resource_name, resource)

  #   current_user.update authentication_token: nil

  #   respond_to do |format|
  #    format.json {
  #    render :json => {
  #      :user => current_user,
  #      :status => :ok,
  #      :authentication_token => current_user.authentication_token
  #     }
  #    }
  #   end
  #  end

  #  def destroy

  #    respond_to do |format|
  #    format.json {
  #      if current_user
  #       current_user.update authentication_token: nil
  #       signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
  #       render :json => {}.to_json, :status => :ok
  #      else
  #         render :json => {}.to_json, :status => :unprocessable_entity
  #      end


  #      }
  #    end
  #   end
  before_action :load_user, only: :create
  before_action :sign_in_params, only: :create
  # before_action :ensure_params_exist, only: :create
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, :only => :create

  # sign in
  def create
      params = user_params
      user = User.find_by_email(params['email'].downcase)
        if user.valid_password?(params['password']) then
          sign_in(user)
          render json: {
          messages: "Signed In Successfully",
          is_success: true,
          data: {user: @user}
        }, status: :ok
        else
           render json: {
          messages: "Signed In Failed - Unauthorized",
          is_success: false,
          data: {}
        }, status: :unauthorized
      end
  end

  def destroy
    respond_to do |format|
      format.json {
        if current_user
          current_user.update authentication_token: nil
          signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
          render :json => {}.to_json, :status => :ok
        else
          render :json => {}.to_json, :status => :unprocessable_entity
        end
      }
    end
  end
    
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def load_user
    @user = User.find_for_database_authentication(email: user_params[:email])
    if @user
      return @user
    else
      render json: {
        messages: "Cannot get User",
        is_success: false,
        data: {}
      }, status: :failure
    end
  end

    # def ensure_params_exist
    #   return if params[:user].present?
    #   render json: {
    #       messages: "Missing Params",
    #       is_success: false,
    #       data: {}
    #     }, status: :bad_request
    # end







end 