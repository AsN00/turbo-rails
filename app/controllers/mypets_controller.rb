class MypetsController < ApplicationController
  before_action :set_mypet, only: %i[ show edit update destroy ]

  # GET /mypets or /mypets.json
  def index
    @mypets = Mypet.all
  end

  # GET /mypets/1 or /mypets/1.json
  def show
  end

  # GET /mypets/new
  def new
    @mypet = Mypet.new
  end

  # GET /mypets/1/edit
  def edit
  end

  # POST /mypets or /mypets.json
  def create
    @mypet = Mypet.new(mypet_params)

    respond_to do |format|
      if @mypet.save
        format.html { redirect_to mypet_url(@mypet), notice: "Mypet was successfully created." }
        format.json { render :show, status: :created, location: @mypet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mypet.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /mypets/1 or /mypets/1.json
  def update
    respond_to do |format|
      if @mypet.update(mypet_params)
        format.html { redirect_to mypet_url(@mypet), notice: "Mypet was successfully updated." }
        format.json { render :show, status: :ok, location: @mypet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mypet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mypets/1 or /mypets/1.json
  def destroy
    @mypet.destroy!

    respond_to do |format|
      format.html { redirect_to mypets_url, notice: "Mypet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mypet
      @mypet = Mypet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mypet_params
      params.require(:mypet).permit(:name, :age, :animal_type, :cost_per_year, :gender)
    end


    def pet_cost_params
      params.require(:mypet).permit(:cost_per_year)
    end
end
