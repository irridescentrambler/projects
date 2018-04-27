require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  it "GET admin_dashboard" do
    sign_in({admin: true})
    get :admin_dashboard
    expect(response.status).to be(200)
  end

  it "GET developer_dashboard" do
    sign_in({admin: false})
    get :developer_dashboard
    expect(response.status).to be(200)
  end

  it "GET hoe_page" do
    sign_in({}, nil)
    get :admin_dashboard
    expect(response.status).to be(302)
  end
end
