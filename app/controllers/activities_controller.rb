class ActivitiesController < LockController
  before_action :get_activities, only: :index
  before_action :set_activity, only: [:edit, :update, :destroy]
  before_action :set_group, only: [:create, :update, :new, :edit]

  def index
  end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      @group.activities << @activity
      @activity.add_role params[:activity][:type]
      flash[:success] = 'The activity was saved!'
      redirect_to new_group_activity_path(@group)
    else
      flash[:error] = 'An error occurred while saving the activity.'
      render :new
    end
  end

  def update
    if @activity.update_attributes(activity_params)
      flash[:success] = 'The activity was updated!'
    else
      flash[:error] = 'An error occurred while updating the activity'
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
  def activity_params
    params.require(:activity).permit(
      :user_id,
      :title,
      :content,
      :deadline,
      :percentage,
      :role
    )
  end

  def get_activities
    @activities = Activity.all
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
