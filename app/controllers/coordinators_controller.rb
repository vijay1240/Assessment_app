class CoordinatorsController < ApplicationController
  
  before_action :find_coordinator, only: [:update, :destroy, :edit, :enroll, :show]

  def index
  	@coordinators = Coordinator.all.page(params[:page]).per(params[:per] || 10)
  end

  def new
    @coordinator = Coordinator.new
  end

  def edit
  end

  def show
  end

  def create
    @coordinator = Coordinator.new(coordinators_params)

    respond_to do |format|
      if @coordinator.save
        format.html { redirect_to coordinators_path, notice: "Coordinator was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @coordinator.update(coordinators_params)
        format.html { redirect_to coordinators_path, notice: "Coordinator was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coordinator.destroy

    respond_to do |format|
      format.html { redirect_to coordinators_path, notice: "Coordinator was successfully destroyed." }
    end
  end

  def enroll
    if request.get?
      @coordinator.enrollment_informations.build if @coordinator.enrollment_informations.blank?
    else
      respond_to do |format|
        if @coordinator.update!(coordinators_params)
          format.html { redirect_to coordinators_path, notice: "Coordinator was successfully updated." }
        else
          format.html { render :enroll, status: :unprocessable_entity }
        end
      end
    end
  end

  def export
    @coordinators = Coordinator.all
    respond_to do |format|
      format.csv { send_data @coordinators.to_csv, filename: "Coordinators-#{Date.today}.csv" }
    end
  end

  private

  def find_coordinator
    @coordinator = Coordinator.includes(enrollment_informations: [:registry, :participants]).find(params[:id])
  end

  def coordinators_params
    params.required(:coordinator).permit(:id, :name, :email, :phone_number, :gender, :date_of_birth, enrollment_informations_attributes: [:registry_id, :method_of_contact, :remarks, participant_ids: []] )
  end

end
