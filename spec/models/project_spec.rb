require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "It checks the validity of project instances" do
    before(:all) do
      @project = Project.new()
    end

    it "Checks whether a project without manager is invalid" do
      expect(@project.valid?).to be(false) 
    end
  end
end
