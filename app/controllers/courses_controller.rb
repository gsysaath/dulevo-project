class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update users_update ]
  before_action :admin_only, only: %i[new create edit update no_sessions]

  def index
    if @role == 'S'
      @courses = Course.all.select { |c| c.courses_sessions != [] }
      @courses_sessions = []
      @courses.each do |course|
        b = course.courses_sessions.sort_by { |c| c.start_time}.first
        @courses_sessions << b
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    
    
    elsif @role == 'A'
      @courses = []
      @courses_sessions = []
      managers = CoursesAreaManager.where(user: current_user)
      managers.each do |manager|
        @courses << manager.course
      end
      @courses = @courses.select { |c| c.courses_sessions != []}
      @courses.each do |course|
        b = course.courses_sessions.sort_by { |c| c.start_time}.first
        @courses_sessions << b
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    
    
    elsif @role == 'D' || @role == 'C' || @role == 'V'
      @courses = []
      @courses_sessions = []
      dealers = CoursesDealer.where(user: current_user)
      dealers.each do |dealer|
        @courses << dealer.course
      end
      @courses = @courses.select { |c| c.courses_sessions != []}
      @courses.each do |course|
        b = course.courses_sessions.sort_by { |c| c.start_time}.first
        @courses_sessions << b
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    
    
    elsif @role == 'T'
      @courses = []
      @courses_sessions = []
      teachers = CoursesTeacher.where(user: current_user)
      teachers.each do |teacher|
        @courses << teacher.course
      end
      @courses = @courses.select { |c| c.courses_sessions != []}
      @courses.each do |course|
        b = course.courses_sessions.sort_by { |c| c.start_time}.first
        @courses_sessions << b
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    
    
    
    elsif @role == 'P'
      @courses = []
      @courses_sessions = []
      participants = CoursesParticipant.where(user: current_user)
      participants.each do |participant|
        @courses << participant.course
      end
      @courses = @courses.select { |c| c.courses_sessions != []}
      @courses.each do |course|
        b = course.courses_sessions.sort_by { |c| c.start_time}.first
        @courses_sessions << b
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    end
  end

  def no_sessions
    @courses = Course.all.select { |c| c.courses_sessions == [] }
  end

  def incoming
    if @role == 'S'
      @courses = Course.all.select { |c| c.courses_sessions != [] }

      @courses_sessions = []
      @courses.each do |course|
        if (course.courses_sessions.sort_by { |c| c.end_time }.last.end_time > Time.now)
          b = course.courses_sessions.sort_by { |c| c.start_time}.first
          @courses_sessions << b
        end
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    
    
    elsif @role == 'A'
      @courses = []
      @courses_sessions = []
      managers = CoursesAreaManager.where(user: current_user)
      managers.each do |manager|
        @courses << manager.course
      end
      @courses = @courses.select { |c| c.courses_sessions != []}
      @courses.each do |course|
        if (course.courses_sessions.sort_by { |c| c.end_time }.last.end_time > Time.now)
          b = course.courses_sessions.sort_by { |c| c.start_time}.first
          @courses_sessions << b
        end
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    
    
    elsif @role == 'D' || @role == 'C' || @role == 'V'
      @courses = []
      @courses_sessions = []
      dealers = CoursesDealer.where(user: current_user)
      dealers.each do |dealer|
        @courses << dealer.course
      end
      @courses = @courses.select { |c| c.courses_sessions != []}
      @courses.each do |course|
        if (course.courses_sessions.sort_by { |c| c.end_time }.last.end_time > Time.now)
          b = course.courses_sessions.sort_by { |c| c.start_time}.first
          @courses_sessions << b
        end
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    
    
    elsif @role == 'T'
      @courses = []
      @courses_sessions = []
      teachers = CoursesTeacher.where(user: current_user)
      teachers.each do |teacher|
        @courses << teacher.course
      end
      @courses = @courses.select { |c| c.courses_sessions != []}
      @courses.each do |course|
        if (course.courses_sessions.sort_by { |c| c.end_time }.last.end_time > Time.now)
          b = course.courses_sessions.sort_by { |c| c.start_time}.first
          @courses_sessions << b
        end
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    
    
    
    elsif @role == 'P'
      @courses = []
      @courses_sessions = []
      participants = CoursesParticipant.where(user: current_user)
      participants.each do |participant|
        @courses << participant.course
      end
      @courses = @courses.select { |c| c.courses_sessions != []}
      @courses.each do |course|
        if (course.courses_sessions.sort_by { |c| c.end_time }.last.end_time > Time.now)
          b = course.courses_sessions.sort_by { |c| c.start_time}.first
          @courses_sessions << b
        end
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    end
  end

  def finished
    if @role == 'S'
      @courses = Course.all.select { |c| c.courses_sessions != [] }

      @courses_sessions = []
      @courses.each do |course|
        if (course.courses_sessions.sort_by { |c| c.end_time }.last.end_time < Time.now)
          b = course.courses_sessions.sort_by { |c| c.start_time}.first
          @courses_sessions << b
        end
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    
    elsif @role == 'A'
      @courses = []
      @courses_sessions = []
      managers = CoursesAreaManager.where(user: current_user)
      managers.each do |manager|
        @courses << manager.course
      end
      @courses = @courses.select { |c| c.courses_sessions != []}
      @courses.each do |course|
        if (course.courses_sessions.sort_by { |c| c.end_time }.last.end_time < Time.now)
          b = course.courses_sessions.sort_by { |c| c.start_time}.first
          @courses_sessions << b
        end
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    
    
    elsif @role == 'D' || @role == 'C' || @role == 'V'
      @courses = []
      @courses_sessions = []
      dealers = CoursesDealer.where(user: current_user)
      dealers.each do |dealer|
        @courses << dealer.course
      end
      @courses = @courses.select { |c| c.courses_sessions != []}
      @courses.each do |course|
        if (course.courses_sessions.sort_by { |c| c.end_time }.last.end_time < Time.now)
          b = course.courses_sessions.sort_by { |c| c.start_time}.first
          @courses_sessions << b
        end
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    
    
    elsif @role == 'T'
      @courses = []
      @courses_sessions = []
      teachers = CoursesTeacher.where(user: current_user)
      teachers.each do |teacher|
        @courses << teacher.course
      end
      @courses = @courses.select { |c| c.courses_sessions != []}
      @courses.each do |course|
        if (course.courses_sessions.sort_by { |c| c.end_time }.last.end_time < Time.now)
          b = course.courses_sessions.sort_by { |c| c.start_time}.first
          @courses_sessions << b
        end
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    
    
    
    elsif @role == 'P'
      @courses = []
      @courses_sessions = []
      participants = CoursesParticipant.where(user: current_user)
      participants.each do |participant|
        @courses << participant.course
      end
      @courses = @courses.select { |c| c.courses_sessions != []}
      @courses.each do |course|
        if (course.courses_sessions.sort_by { |c| c.end_time }.last.end_time < Time.now)
          b = course.courses_sessions.sort_by { |c| c.start_time}.first
          @courses_sessions << b
        end
      end
      @courses_sessions.sort_by! { |c| c.start_time }
    end
  end

  def show
    @sessions = CoursesSession.where(course: @course).order(:start_time)
    @dealers = CoursesDealer.where(course: @course)
    @teachers = CoursesTeacher.where(course: @course)
    @participants = CoursesParticipant.where(course: @course)
    @registers = CoursesRegister.where(course: @course)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to course_path(@course), notice: 'Created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to course_path(@course), notice: 'Updated successfully'
    else
      render :edit
    end
  end


  def destroy
    @course.destroy
    redirect_to courses_path, notice: 'Deleted successfully'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def admin_only
    if current_user.roles_type_code != 'S'
      redirect_to root_path
      flash[:alert] = "You are not authorized!"
    end
  end

  def course_params
    params.require(:course).permit(
      :name,
      :description,
      :language,
      :status,
      :start_date,
      :start_time,
      :end_time,
      :note,
      :close,
      :max_register,
      :courses_type_id,
      :location_id)
  end
end
