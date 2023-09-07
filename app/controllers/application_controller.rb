class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  def after_sign_in_path_for(resource)
    resource.role == 'admin' ? admin_dashboard_index_path : root_path
  end
end
