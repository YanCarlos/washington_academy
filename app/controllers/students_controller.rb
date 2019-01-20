class StudentsController < LockController
  authorize_resource class: false
  before_action :get_students, only: :index
  before_action :set_student, only: [:edit, :update]

  def index
  end

  def new
    @student = User.new
  end

  def edit
  end

  def create
    @student = User.new(student_params)
    if @student.save
      @student.be_student
      flash[:success] = 'The new student was saved!'
      redirect_to :new_student
    else
      flash[:error] = "An error occurred while saving the student \n #{@student.errors.full_messages.to_sentence}"
      render :new
    end
  end

  def update
    if @student.update_attributes(student_params)
      flash[:success] = 'The student was updated!'
    else
      flash[:error] = "An error occurred while updating the student \n #{@student.errors.full_messages.to_sentence}"
    end
    render :edit
  end

  
  private
  def student_params
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

  def get_students
    @students = User.with_role :student
  end

  def set_student
    @student = User.find(params[:id])
  end

end
