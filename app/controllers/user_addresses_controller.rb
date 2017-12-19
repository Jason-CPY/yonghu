class UserAddressesController < ApplicationController
  before_action :set_user_address, only: [:show, :edit, :update, :destroy]

  # GET /user_addresses
  # GET /user_addresses.json
  def index
    @user_addresses = current_user.user_addresses
  end

  # GET /user_addresses/1
  # GET /user_addresses/1.json
  def show
  end

  # GET /user_addresses/new
  def new
    @user_address = UserAddress.new
    @user_address.build_address
  end

  # GET /user_addresses/1/edit
  def edit
  end

  # POST /user_addresses
  # POST /user_addresses.json
  def create
    @user_address = UserAddress.new(user_address_params.merge(city: current_city, user: current_user))

    respond_to do |format|
      if @user_address.save
        format.html { redirect_to user_addresses_path, notice: 'User address was successfully created.' }
      else
        format.json { render json: @user_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_addresses/1
  # PATCH/PUT /user_addresses/1.json
  def update
    respond_to do |format|
      if @user_address.update(user_address_params)
        format.html { redirect_to user_addresses_path, notice: 'User address was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /user_addresses/1
  # DELETE /user_addresses/1.json
  def destroy
    @user_address.destroy
    respond_to do |format|
      format.html { redirect_to user_addresses_path, notice: 'User address was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_address
      @user_address = UserAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_address_params
      ret = params.require(:user_address).permit(:name, address_attributes: [:id, :address, :comment, :lat, :lng])
      ret[:address_attributes].delete(:address) if ret[:address_attributes][:address].blank?
      ret
    end
end