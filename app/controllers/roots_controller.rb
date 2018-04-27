class RootsController < ApplicationController
  before_action :authenticate_user!
  def main
    if current_user.admin?
      redirect_to admin_dashboard_pages_path
    elsif current_user.developer?
      redirect_to developer_dashboard_pages_path
    else
      home_page_pages_path
    end
  end
end
