class AmountTypesController < ApplicationController
  before_action :set_amount_type, only: [:show, :edit, :update, :destroy]
  layout "admin"
  # GET /amount_types
  # GET /amount_types.json
  def index
    @amount_types = AmountType.all
  end

  # GET /amount_types/1
  # GET /amount_types/1.json
  def show
  end

  # GET /amount_types/new
  def new
    @amount_type = AmountType.new
  end

  # GET /amount_types/1/edit
  def edit
  end

  # POST /amount_types
  # POST /amount_types.json
  def create
    @amount_type = AmountType.new(amount_type_params)

    respond_to do |format|
      if @amount_type.save
        format.html { redirect_to @amount_type, notice: 'Amount type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @amount_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @amount_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /amount_types/1
  # PATCH/PUT /amount_types/1.json
  def update
    respond_to do |format|
      if @amount_type.update(amount_type_params)
        format.html { redirect_to @amount_type, notice: 'Amount type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @amount_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amount_types/1
  # DELETE /amount_types/1.json
  def destroy
    @amount_type.destroy
    respond_to do |format|
      format.html { redirect_to amount_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amount_type
      @amount_type = AmountType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def amount_type_params
      params.require(:amount_type).permit(:name)
    end
end
