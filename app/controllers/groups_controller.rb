class GroupsController < LockController
  before_action :get_groups, only: :index
  before_action :set_group, only: [:edit, :update, :destroy]
  before_action :get_avaliable_teachers, only: :edit

  def index
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    if Group.create(group_params)
      flash[:success] = 'The new group was saved!'
      redirect_to :new_group
    else
      flash[:error] = 'An error occurred while saving the group'
      render :new
    end
  end

  def update
    if @group.update_attributes(group_params)
      flash[:success] = 'The group was updated!'
    else
      flash[:error] = 'An error occurred while updating the group'
    end
    render :edit
  end

  def destroy
    if @group.destroy
      flash[:success] = 'The group was deleted!'
    else
      flash[:error] = 'An error occurred while deleting the group'
    end
    redirect_to :back
  end

  def add_teacher
    teacher = User.find(params[:teacher_id])
    group = Group.find(params[:group_id])
    if group.teachers << teacher
      flash[:success] = "#{teacher.name} has been added to this group."
    else
      flash[:error] = "An error ocurred!"
    end
    redirect_to edit_group_path(group)
  end

  def delete_teacher
    teacher = User.find(params[:teacher_id])
    group = Group.find(params[:group_id])
    if group.teachers.delete(teacher)
      flash[:success] = "#{teacher.name} has been deleted from this group."
    else
      flash[:error] = "An error ocurred!"
    end
    redirect_to edit_group_path(group) 
  end

  private
  def group_params
    params.require(:group).permit(:name, :description)
  end

  def get_groups
    @groups = Group.all
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def get_avaliable_teachers
    @avalaible_teachers = User.with_role(:teacher).where(active: true).where.not(id: @group.teachers.pluck(:id))
  end

end
