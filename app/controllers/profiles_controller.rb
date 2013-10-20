class ProfilesController < ApplicationController
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @user = User.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @user }
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to profile_path(@user), notice: "User Was Created" }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_path(@user), notice: 'User was successfully updated' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :speaker
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :location, :homepage)
  end
end
