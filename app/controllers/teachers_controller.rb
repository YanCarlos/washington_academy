class TeachersController < LockController
  authorize_resource class: false
  before_action :get_teachers, only: :index
  before_action :set_teacher, only: [:edit, :update]

  def index
  end

  def new
    @teacher = User.new
  end

  def edit
  end

  def create
    @teacher = User.new(teacher_params)
    if @teacher.save
      @teacher.be_teacher
      flash[:success] = 'The new teacher was saved!'
      redirect_to :new_teacher
    else
      flash[:error] = "An error occurred while saving the teacher \n #{@teacher.errors.full_messages.to_sentence}"
      render :new
    end
  end

  def update
    if @teacher.update_attributes(teacher_params)
      flash[:success] = 'The teacher was updated!'
    else
      flash[:error] = "An error occurred while updating the teacher \n #{@teacher.errors.full_messages.to_sentence}"
    end
    render :edit
  end

  
  private
  def teacher_params
    params.require(:user).permit(
      :name, 
      :phone, 
      :email, 
      :address, 
      :group_id, 
      :identification,
      :avatar,
      :active
    )
  end

  def get_teachers
    @teachers = User.with_role :teacher
  end

  def set_teacher
    @teacher = User.find(params[:id])
  end

end
