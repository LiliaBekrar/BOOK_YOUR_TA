class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy, :show, :edit]
  before_action :set_teacher, only: [:new, :create]
  before_action :set_user, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.teacher = @teacher
    @booking.user = @user
    if @booking.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to user_path(@user)
  end

  private

  def booking_params
    params.require(:booking).permit(:teacher_id, :user_id, :date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end
end
