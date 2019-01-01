class Admin::TeachersController < Admin::BaseController
  add_breadcrumb 'Teachers', :admin_teachers_path
  before_action :set_teacher, only: [:edit, :update, :destroy]


  def index
    @teachers = Teacher.order(id: :desc).page(params[:page])
  end

  def new
    add_breadcrumb 'Are you a teacher', new_admin_teacher_path
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
       redirect_to admin_teachers_path, notice: 'succesfully created'
     else
      add_breadcrumb 'Are you a teacher', new_admin_teacher_path
      flash.now[:alert] = 'could not create a teacher'
       render :new
     end
  end

  def edit
    add_breadcrumb "Edit Teacher #{@teacher.first_name} #{@teacher.last_name}", [:edit, :admin, @teacher]
  end

  def update
    if @teacher.update(teacher_params)
       redirect_to admin_teachers_path, notice: 'succesfully updated'
     else
      add_breadcrumb "Teacher #{@teacher.first_name} #{@teacher.last_name}",  [:edit, :admin, @teacher]
      flash.now[:alert] = 'Update not successfull, try gain'
       render :edit
     end
  end

  def destroy
    if @teacher.destroy
       redirect_to admin_teachers_path, notice: 'succesfully deleted'
     else
       redirect_to admin_teachers_path, alert: 'something went wrong, try again'
    end
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :description)
  end

  def set_active_main_menu_item
    @main_menu[:teachers][:active] = true
  end
end
