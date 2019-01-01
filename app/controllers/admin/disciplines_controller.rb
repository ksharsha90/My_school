class Admin::DisciplinesController < ApplicationController
	add_breadcrumb 'Disciplines', :admin_disciplines_path
  before_action :set_discipline, only: [:edit, :update, :destroy]


  def index
    @disciplines = Discipline.order(id: :desc).page(params[:page])
  end

  def new
    add_breadcrumb 'Are you a discipline', new_admin_discipline_path
    @discipline = Discipline.new
  end

  def create
    @discipline = Discipline.new(discipline_params)

    if @discipline.save
       redirect_to admin_disciplines_path, notice: 'succesfully created'
     else
      add_breadcrumb 'Are you a discipline', new_admin_discipline_path
      flash.now[:alert] = 'could not create a discipline'
       render :new
     end
  end

  def edit
    add_breadcrumb "Edit Discipline #{@discipline.name}", [:edit, :admin, @discipline]
  end

  def update
    if @discipline.update(discipline_params)
       redirect_to admin_disciplines_path, notice: 'succesfully updated'
     else
      add_breadcrumb "Discipline #{@discipline.first_name} #{@discipline.last_name}",  [:edit, :admin, @discipline]
      flash.now[:alert] = 'Update not successfull, try gain'
       render :edit
     end
  end

  def destroy
    if @discipline.destroy
       redirect_to admin_disciplines_path, notice: 'succesfully deleted'
     else
       redirect_to admin_disciplines_path, alert: 'something went wrong, try again'
    end
  end

  private

  def set_discipline
    @discipline = Discipline.find(params[:id])
  end

  def discipline_params
    params.require(:discipline).permit(:first_name, :last_name, :description)
  end

  def set_active_main_menu_item
    @main_menu[:disciplines][:active] = true
  end
end
