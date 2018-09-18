class WorkshopsController < LockController
  before_action :get_workshops, only: :index
  before_action :set_group, only: [:edit, :update, :destroy]
  before_action :get_avaliable_teachers, only: :edit

  def index
  end

  def new
    @workshop = Workshop.new
  end

  def edit
  end

  def create
    @workshop = Workshop.new(workshop_params)
    if workshop.save
      workshop.add_role params[:role]
      flash[:success] = 'The new workshop was saved!'
      redirect_to :new_workshop
    else
      flash[:error] = 'An error occurred while saving the workshop'
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
  def workshop_params
    params.require(:group).permit(
      :group_id,
      :user_id,
      :title,
      :content,
      :deadline,
      :percentage
    )
  end

  def get_workshops
    @Workshops = Workshop.all
  end

  def set_group
    @Workshop = Workshop.find(params[:id])
  end

end
