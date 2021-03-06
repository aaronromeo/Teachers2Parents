class MessagingCentresController < ApplicationController
  before_action :set_messaging_centre, only: [:show, :edit, :update, :destroy]

  # GET /messaging_centres
  # GET /messaging_centres.json
  def show
    if current_user.role == 'parent'
      @students = current_user.students
    elsif current_user.role == 'teacher'
      @students = current_user.student_class.students.all
    end
    true
    #@messaging_centres = MessagingCentre.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_messaging_centre
      #@messaging_centre = MessagingCentre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def messaging_centre_params
      params[:messaging_centre]
    end
end
