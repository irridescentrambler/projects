module ProjectsHelper
  def project_description_decorator(description)
    description.try(:truncate, 10)
  end
end
