class ApplicationController < ActionController::Base
	rescue_from CanCan::AccessDenied do |exception|
    redirect_to notfound_index_path
  end

  protected
    def after_sign_in_path_for(resource)
      groups_path
    end
end
