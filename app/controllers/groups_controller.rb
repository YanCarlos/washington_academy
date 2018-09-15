class GroupsController < LockController
  before_action :get_groups, only: :index
  before_action :set_group, only: [:edit, :update, :destroy]

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

end
