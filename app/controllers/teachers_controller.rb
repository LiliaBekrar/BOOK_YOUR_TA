class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]
  def new
    @teacher = Teacher.new
  end

  def index
    @teachers = Teacher.all
    @markers = @teachers.geocoded.map do |teacher|
      if teacher.photo.attached?
        image = Cloudinary::Utils.cloudinary_url(teacher.photo.key).gsub('upload', 'upload/v1/development')
      else
        image = Cloudinary::Utils.cloudinary_url("snnvw9r2am4ln8d8psfu_bzaor1.jpg").gsub('upload', 'upload/v1/development')
     end

      {
        lat: teacher.latitude,
        lng: teacher.longitude,
        image_url: image
      }
    end
  end

  def show
  end

  def edit
  end

  def booking_teacher_list
    @bookings_teacher = @teacher.bookings
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.user = @user
    if @teacher.save
      redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to teacher_path(@teacher)
    else
      render :edit
    end
  end

  def destroy
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def teacher_params
    params.require(:teacher).permit(:description, :price, :specialty, :city_name, :latitude, :longitude, :photo,  :user_id)
  end
end
