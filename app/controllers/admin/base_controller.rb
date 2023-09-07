class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  private

  def check_admin
    redirect_to root_path, alert: "権限がありません" unless current_user.role == 'admin'
  end
end
