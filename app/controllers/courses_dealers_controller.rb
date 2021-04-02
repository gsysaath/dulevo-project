class CoursesDealersController < ApplicationController
  before_action :admin_only, except: [ :quit, :participate ]
  before_action :set_course, only: [ :index, :new, :create, :edit, :update, :quit, :participate ]
  before_action :set_dealer, only: [ :edit, :update, :destroy, :quit, :participate ]

  def index
    @dealers = CoursesDealer.where(course: @course)
  end

  def new
    @dealer = CoursesDealer.new
  end

  def create
    @dealer = CoursesDealer.new(courses_dealer_params)
    @dealer.course = @course
    if @dealer.save!
      redirect_to course_courses_dealers_path(@course), notice: 'Saved successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dealer.update(courses_dealer_params)
      redirect_to course_courses_dealers_path(@course), notice: 'Edited succesfully'
    else
      render :edit
    end
  end

  def destroy
    course = @dealer.course
    @dealer.destroy
    redirect_to course_courses_dealers_path(course), notice: 'Deleted successfully'
  end

  def quit
    @sessions = CoursesSession.where(course: @course).order(:start_time)
    @time_limit = @sessions.first.start_time - 10.days
    difference = DateTime.now > @time_limit
    DateTime.now > @time_limit ? @over = true : @over = false
    if (@dealer.user == current_user || @role == 'S') && @over == false
      @dealer.update!(participate: "N")
      redirect_to course_path(@course), notice: "You're not participating anymore"
    else
      redirect_to root_path, notice: "You're not allowed"
    end
  end

  def participate
    @sessions = CoursesSession.where(course: @course).order(:start_time)
    @time_limit = @sessions.first.start_time - 10.days
    difference = DateTime.now > @time_limit
    DateTime.now > @time_limit ? @over = true : @over = false
    if (@dealer.user == current_user || @role == 'S') && @over == false
      @dealer.update!(participate: "Y")
      redirect_to course_path(@course), notice: "You're participating now"
    else
      redirect_to root_path, notice: "You're not allowed"
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_dealer
    @dealer = CoursesDealer.find(params[:id])
  end

  def admin_only
    if (current_user.roles_type_code != 'S' && current_user.roles_type_code != 'A')
      redirect_to root_path
      flash[:alert] = "You are not authorized!"
    end
  end

  def courses_dealer_params
    params.require(:courses_dealer).permit(
      :participate,
      :mail_count,
      :date_participate,
      :user_id,
      :course_id)
  end

end
