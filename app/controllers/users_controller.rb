class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :reset_password]

  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users/1/edit
  def edit
  end

  def reset_password
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_card_logs
    @user_card_logs = current_user.user_card.user_card_logs.paginate(page: params[:page], per_page: 10).order(id: :desc)
  end

  def coupons
    @coupons = current_user.coupons.where('used_at is null').paginate(page: params[:page], per_page: 10).order(valid_to: :desc)
  end


  def change_current_city
    session[:current_city_id] = params[:city_id]
    redirect_back fallback_location: root_path
  end

  private
    def set_outlet
      @outlet = Outlet.find(params[:outlet_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, city_ids: [])
    end
end
