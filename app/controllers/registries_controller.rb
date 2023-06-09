class RegistriesController < ApplicationController
  
  before_action :find_registry, only: [:update, :destroy, :edit, :show]

  def index
    @registries = Registry.all.page(params[:page]).per(params[:per] || 10)
  end

  def new
    @registry = Registry.new
  end

  def create
    @registry = Registry.new(registry_params)

    respond_to do |format|
      if @registry.save
        format.html { redirect_to registries_path, notice: "Registry was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @registry.update(registry_params)
        format.html { redirect_to registries_path, notice: "Registry was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @registry.destroy

    respond_to do |format|
      format.html { redirect_to registries_path, notice: "Registry was successfully destroyed." }
    end
  end

  def show
  end

  private

  def find_registry
    @registry = Registry.find(params[:id])
  end

  def registry_params
    params.required(:registry).permit(:id, :name, :location, :status, coordinator_ids: [])
  end

end
