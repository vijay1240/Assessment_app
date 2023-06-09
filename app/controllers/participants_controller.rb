class ParticipantsController < ApplicationController
  
  before_action :find_participant, only: [:update, :destroy, :edit, :show]

  def index
    @participants = Participant.all.page(params[:page]).per(params[:per] || 10)
  end

  def new
    @participant = Participant.new
  end

  def edit
  end

  def show
  end

  def create
    @participant = Participant.new(participants_params)

    respond_to do |format|
      if @participant.save
        format.html { redirect_to participants_path, notice: "Participant was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @participant.update!(participants_params)
        format.html { redirect_to participants_path, notice: "Participant was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to participants_path, notice: "Participant was successfully destroyed." }
    end
  end

  private

  def find_participant
    @participant = Participant.find(params[:id])
  end

  def participants_params
    params.required(:participant).permit(:id, :name, :email, :phone_number, :gender, :date_of_birth, :type)
  end

end

