class CitiesUsersController < ApplicationController
  before_action :set_cities_user, only: [:show, :edit, :update, :destroy]

  # GET /cities_users
  # GET /cities_users.json
  def index
    @cities_users = CitiesUser.all
  end

  # GET /cities_users/1
  # GET /cities_users/1.json
  def show
  end

  # GET /cities_users/new
  def new
    @cities_user = CitiesUser.new
  end

  # GET /cities_users/1/edit
  def edit
  end

  # POST /cities_users
  # POST /cities_users.json
  def create
    @cities_user = CitiesUser.new(cities_user_params)

    respond_to do |format|
      if @cities_user.save
        format.html { redirect_to @cities_user, notice: 'Cities user was successfully created.' }
        format.json { render :show, status: :created, location: @cities_user }
      else
        format.html { render :new }
        format.json { render json: @cities_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities_users/1
  # PATCH/PUT /cities_users/1.json
  def update
    respond_to do |format|
      if @cities_user.update(cities_user_params)
        format.html { redirect_to @cities_user, notice: 'Cities user was successfully updated.' }
        format.json { render :show, status: :ok, location: @cities_user }
      else
        format.html { render :edit }
        format.json { render json: @cities_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities_users/1
  # DELETE /cities_users/1.json
  def destroy
    @cities_user.destroy
    respond_to do |format|
      format.html { redirect_to cities_users_url, notice: 'Cities user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cities_user
      @cities_user = CitiesUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cities_user_params
      params.require(:cities_user).permit(:city_id)
    end
end
