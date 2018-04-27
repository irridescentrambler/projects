require 'rails_helper'

RSpec.describe RootsController, type: :controller do
  describe "RootsController" do
    it "Goes to admin dashboard" do
      sign_in({admin: true})
      get :main
      expect(response).to redirect_to(admin_dashboard_pages_path)
    end

    it "Goes to developer dashboard" do
      sign_in({admin: false})
      get :main
      expect(response).to redirect_to(developer_dashboard_pages_path)
    end
  end
end
