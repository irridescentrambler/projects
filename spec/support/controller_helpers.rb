require 'support/factory_bot'
module ControllerHelpers
  def sign_in(options = {}, user = double('user'))
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user).and_return(nil)
    else
      allow(user).to receive(:managed_projects).and_return([])
      allow(user).to receive(:admin?).and_return(options[:admin])
      allow(user).to receive(:developer?).and_return(!options[:admin])
      allow(user).to receive(:id).and_return(1)
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
  end

  def sign_in_with_factory(options = {}, user)
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
  end
end