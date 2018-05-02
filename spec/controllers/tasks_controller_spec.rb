require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  before(:all) do 
    @admin = create(:admin)
    @developer = create(:developer)
    @project = create(:project, manager_id: @admin.id)
    @task = create(:task, creator_id: @admin.id, developer_id: @developer.id, project_id: @project.id )
  end

  after(:all) do
    @admin.destroy
    @developer.destroy
    @task.destroy
  end

  it "GET index" do
    sign_in_with_factory(@admin)
    get :index
    expect(response.status).to be(200) 
  end

  it "GET new" do
    sign_in_with_factory(@admin)
    get :new
    expect(response.status).to be(200) 
  end

  it "GET show" do
    sign_in_with_factory(@admin)
    get :show, :params => { id: @task.id }
    expect(response.status).to be(200) 
  end

  it "POST create" do
    sign_in_with_factory(@admin)
    post :create, :params => { :task => { name: "Demo name", description: "Demo description" } }
    expect(response.status).to be(302) 
  end

  it "GET edit" do
    sign_in_with_factory(@admin)
    get :edit, :params => { id: @task.id }
    expect(response.status).to be(200) 
  end

  it "PUT update" do
    sign_in_with_factory(@admin)
    put :update, :params => { id: @task.id, task: { name: "Updated task name" } }
    expect(response.status).to be(302) 
  end

  it "DELETE destroy" do
    sign_in_with_factory(@admin)
    delete :destroy, :params => { id: @task.id }
    expect(response.status).to be(302) 
  end
end
