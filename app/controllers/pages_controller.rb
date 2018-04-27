class PagesController < ApplicationController

  def admin_dashboard
    authorize! :visit, :admin_dashboard
  end

  def developer_dashboard
    authorize! :visit, :developer_dashboard
  end

  def home_page
  end
end
