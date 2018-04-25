module UserRoleHelper
  def roles(*roles)
    roles.each do |role_name|
      define_method(role_name.to_s + "?") do
        role_name.to_s == role
      end
    end
  end
end