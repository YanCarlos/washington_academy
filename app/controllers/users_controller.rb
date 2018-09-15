class UsersController < LockController
  before_action :set_user, only: [:destroy]

  def destroy
    if @user.destroy
      flash[:success] = 'The user was deleted!'
    else
      flash[:error] = 'An error occurred while deleting the user'
    end
    redirect_to :back
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
