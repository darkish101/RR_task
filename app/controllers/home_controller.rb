class HomeController < ApplicationController
  # def index
  # before_action :set_request, only: %i[ show edit update destroy ]

  # GET /friends or /friends.json
  def index
    @users = User.all
  end

  # GET /friends/1 or /friends/1.json
  def show
     @user = User.find(params[:id])
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # GET /friends/new
  # def new
  #   @roles = ["teacher", "student"]
  #   @users ||= User.new
  # end

  # GET /friends/1/edit

   def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

  # POST /friends or /friends.json
   def create #todo add vaildations
        @user = User.new(user_params)
        if @user.save
            redirect_to home_index_url, notice: "User succesfully created!" 
        else
            render :new, notice: @user.errors, status: :unprocessable_entity 
        # format.json { render json: @user.errors, status: :unprocessable_entity }
            # render :new
        end
    end

  # def create
  # #   #  request_hash = {
  # #   #   :name => params[:user][:name],
  # #   #   :email => params[:user][:email],
  # #   #   :role => params[:user][:role],
  # #   #   :password => params[:user][:password],
  # #   #   :password_confirmation => params[:user][:password_confirmation]
  # #   # }
  # #   # @user = User.new(request_hash)
    
  #   @user = User.new(user_params)
  #   @user.save
  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: "User was successfully created." }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /friends/1 or /friends/1.json
  # def update
  #   respond_to do |format|
  #     if @users.update(user_params)
  #       format.html { redirect_to home_url, notice: "User was successfully updated." }
  #       format.json { render :show, status: :ok, location: home_home_urlindex }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to home_index_url, notice: "Updated User."
        else
            render :edit
        end
    end
  # DELETE /friends/1 or /friends/1.json
  def destroy
     @foundUser = User.find(params[:id])
    if @foundUser.present?
      @foundUser.destroy
    end
    respond_to do |format|
      format.html { redirect_to home_index_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation, :role)
    end
end



