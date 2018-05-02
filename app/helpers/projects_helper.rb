module ProjectsHelper
  def project_description_decorator(description)
    description.try(:truncate, 25)
  end
end
