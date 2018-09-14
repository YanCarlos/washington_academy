class GroupsController < LockController
	before_action :get_groups, only: :index

	def index
	end

	def new
		@group = Group.new
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

	private
	def group_params
		params.require(:group).permit(:name, :description)
	end

	def get_groups
		@groups = Group.all
	end

end
