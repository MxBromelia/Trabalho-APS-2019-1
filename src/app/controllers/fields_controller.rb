class FieldsController < ApplicationController
  before_action :set_field, only: [:show, :edit, :update, :destroy]

  # GET /fields
  def index
    @fields = Field.all
  end

  # GET /fields/1
  def show
  end

  # GET /fields/new
  def new
    @field = Field.new
  end

  # GET /fields/1/edit
  def edit
  end

  # POST /fields
  def create
    @field = Field.new(field_params)

    if @field.save
      redirect_to fields_path, notice: 'Field was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /fields/1
  def update
    if @field.update(field_params)
      redirect_to fields_path, notice: 'Field was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /fields/1
  # DELETE /fields/1.json
  def destroy
    @field.destroy
    format.html { redirect_to fields_url, notice: 'Field was successfully destroyed.' }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_field
    @field = Field.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def field_params
    params.require(:field).permit(:name)
  end
end
