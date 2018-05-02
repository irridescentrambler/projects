require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before(:all) do 
    @user = create(:admin)
    @project = create(:project, manager_id: @user.id)
  end

  after(:all) do
    @user.destroy
    @project.destroy
  end

  it "GET index" do
    sign_in_with_factory(@user)
    get :index
    expect(response.status).to be(200)
  end

  it "GET new" do
    sign_in_with_factory(@user)
    get :new
    expect(response.status).to be(200)
  end

  it "POST create" do
    sign_in_with_factory(@user)
    post :create, :params => { :project => { :name => "Demo project", :description => "abcdef" } }
    expect(response.status).to be(302)
  end

  it "GET show" do
    sign_in_with_factory(@user)
    get :show, :params => {id: @project.id }
    expect(response.status).to be(200)
  end

  it "GET edit" do
    sign_in_with_factory(@user)
    get :edit, :params => {id: @project.id }
    expect(response.status).to be(200)
  end

  it "PUT update" do
    sign_in_with_factory(@user)
    put :update, :params => {id: @project.id, project: { name: "Updated name", description: "Updated description" }}
    expect(response.status).to be(302)
  end

  it "DELETE delete" do
    sign_in_with_factory(@user)
    delete :destroy, :params => {id: @project.id }
    expect(response.status).to be(302)
  end
end
