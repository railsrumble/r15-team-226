class DisucssionsController < ApplicationController
  before_action :set_disucssion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_owner!, only: [:new, :edit, :update, :destroy, :create]

  # GET /disucssions
  # GET /disucssions.json
  def index
    @disucssions = Disucssion.all
  end

  # GET /disucssions/1
  # GET /disucssions/1.json
  def show
  end

  # GET /disucssions/new
  def new
    @disucssion = Disucssion.new
  end

  # GET /disucssions/1/edit
  def edit
  end

  # POST /disucssions
  # POST /disucssions.json
  def create
    @disucssion = Disucssion.new(disucssion_params)

    respond_to do |format|
      if @disucssion.save
        format.html { redirect_to @disucssion, notice: 'Disucssion was successfully created.' }
        format.json { render :show, status: :created, location: @disucssion }
      else
        format.html { render :new }
        format.json { render json: @disucssion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disucssions/1
  # PATCH/PUT /disucssions/1.json
  def update
    respond_to do |format|
      if @disucssion.update(disucssion_params)
        format.html { redirect_to @disucssion, notice: 'Disucssion was successfully updated.' }
        format.json { render :show, status: :ok, location: @disucssion }
      else
        format.html { render :edit }
        format.json { render json: @disucssion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disucssions/1
  # DELETE /disucssions/1.json
  def destroy
    @disucssion.destroy
    respond_to do |format|
      format.html { redirect_to disucssions_url, notice: 'Disucssion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disucssion
      @disucssion = Disucssion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disucssion_params
      params.require(:disucssion).permit(:topic, :content, :type, :breed)
    end
end
